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
      opencodeCli = oc.packages.${pkgs.system}.opencode-cli;
    })
  ];
}
