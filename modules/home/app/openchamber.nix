{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    # Straight from upstream's flake: since v2.7.0 the bun deps derive from
    # bun.lock (bun2nix) and there is no aggregate hash to re-bake anymore.
    # opencodeCli stays on nixpkgs so the server uses the same derivation as
    # the user CLI in cli/ai.nix (>= MINIMUM_OPENCODE_VERSION 2.1.0).
    (inputs.openchamber.packages.${pkgs.system}.openchamber.override {
      opencodeCli = pkgs.opencode;
    })
  ];
}
