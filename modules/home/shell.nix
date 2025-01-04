{ config, pkgs, lib, ... }:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      shellAliases = {
        cat = "bat -P --style=header";
        kx = "kubie ctx";
        kns = "kubie ns";
      };
      history = {
        append = true;
        share = true;
        expireDuplicatesFirst = true;
        ignoreAllDups = true;
        save = 15000;
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "sudo"
          "git"
          "kubectl"
          "kubectx"
          "helm"
          "opentofu"
          "terraform"
          "uv"
          "ansible"
          "fluxcd"
          "ssh"
        ];
      };
      initContent = ''
        source <(kubie generate-completion)
      '';
    };

    starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {

        add_newline = true;
        format = lib.concatStrings [
          "$directory"
          "$openstack"
          "$kubernetes"
          "$git_branch"
          "$git_status"
          "$line_break"
          "$character"
        ];
        directory = {
          truncation_length = 3;
          truncation_symbol = "…/";
          style = "bold green";
          format = "[$path]($style) ";
        };
        sudo = {
          format = "[$symbol]($style)";
          style = "bold red";
        };
        git_branch = {
          symbol = "";
          format = "[$symbol$branch(:$remote_branch)]($style) ";
          style = "bold green";
        };
        git_status = {
          format = "[$all_status$ahead_behind]($style) ";
          style = "bold red";
        };
        kubernetes = {
          disabled = false;
          symbol = "k8s:";
          format = "[$symbol$context \\[$namespace\\]]($style) ";
          style = "bold blue";
        };
        openstack = {
          disabled = false;
          symbol = "OS:";
          format = "[$symbol\\[$project\\]]($style) ";
          style = "bold red";
        };
      };
    };

  };
}
