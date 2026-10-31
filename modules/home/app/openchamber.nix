{
  pkgs,
  inputs,
  ...
}:let
  oc = inputs.openchamber;
  # Upstream bakes the bunDeps fixed-output hash in its own CI; it does not
  # reproduce elsewhere (see pinned rev note in flake.nix). Value captured
  # from the "got:" line of a local build at this pin, same two-pass flow as
  # upstream's nix/update-hashes.sh. Re-bake from the next build failure's
  # "got:" line when bun.lock moves upstream OR when a nixpkgs bump changes
  # the bun version used by bunDeps (either changes the FOD content).
  bunDepsHash = "sha256-RGwY/l+DuuvyyTpZ+EWqy8LBmkRpkBsF+9g/AGbuJE8=";
  src = pkgs.runCommand "openchamber-src" {} ''
    cp -a ${oc}/. $out/
    chmod -R u+w $out
    sed -i "s|${(builtins.fromJSON (builtins.readFile "${oc}/nix/hashes.json")).bunDeps}|${bunDepsHash}|" $out/nix/hashes.json
  '';
in{
  home.packages = [
    (pkgs.callPackage "${src}/nix/package.nix" {
      self = src;
      version = (builtins.fromJSON (builtins.readFile "${oc}/package.json")).version;
      # OpenChamber prefixes its wrapper PATH with this CLI and gates the
      # server on MINIMUM_OPENCODE_VERSION = 2.1.0, so the flake-pinned
      # opencode-cli 2.0.32 tripped the version gate and offered its
      # out-of-Nix installer. nixpkgs opencode (>= 2.1.0) is the same
      # derivation as the user CLI in cli/ai.nix; upstream's "nixpkgs is
      # the older 1.x line" comments are stale at this pin.
      opencodeCli = pkgs.opencode;
    })
  ];
}
