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
        ];
      userSettings = {
        "window.autoDetectColorScheme" = true;

        "workbench.preferredDarkColorTheme" = "Default Dark+";
        "workbench.preferredLightColorTheme" = "Default Light+";

        "window.titleBarStyle" = "custom";
      };
    };
  };
}
