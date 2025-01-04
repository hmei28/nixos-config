# modules/home/cli/cloud-k8s.nix
{ pkgs, ... }:
{
  programs.kubecolor = {
    enable = true;
    enableAlias = true;       # kubectl -> kubecolor automatiquement
    enableZshIntegration = true;
  };

  # Désactive le prompt kubie (starship gère l'affichage du contexte k8s)
  home.file.".kube/kubie.yaml".text = ''
    prompt:
      disable: true
  '';

  home.packages = with pkgs; [
    # Kubernetes
    krew
    kubie
    kubernetes-helm
    k9s
    fluxcd
    talosctl
    talhelper

    kubelogin-oidc

    # Infra as Code
    terraform
    terraform-docs
    tflint

    # OpenStack
    openstackclient-full
  ];
}