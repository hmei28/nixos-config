{ pkgs, ... }:  {

  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
          dracula-theme.theme-dracula
          ms-python.python
          ms-python.pylint
          bbenoist.nix
          wholroyd.jinja
          redhat.vscode-yaml
          yzhang.markdown-all-in-one
          pkief.material-icon-theme
          signageos.signageos-vscode-sops
          catppuccin.catppuccin-vsc
          hashicorp.terraform
          tamasfe.even-better-toml
          unifiedjs.vscode-mdx
          shardulm94.trailing-spaces
        ] ++ [
          (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
            mktplcRef = {
              publisher = "haikalllp";
              name = "matugen-theme";
              version = "1.0.2";
              hash = "sha256-fy3+e8MT5hh619pNyBPdMIZGnBpl70TOtO0YSnnay/Y=";
            };
            vsix = pkgs.fetchurl {
              name = "matugen-theme-1.0.2.vsix";
              url = "https://haikalllp.gallery.vsassets.io/_apis/public/gallery/publisher/haikalllp/extension/matugen-theme/1.0.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
              hash = "sha256-fy3+e8MT5hh619pNyBPdMIZGnBpl70TOtO0YSnnay/Y=";
            };
          })
        ];
    };
  };
}
