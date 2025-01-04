{ username, ... }: {
  imports = [
    ./desktops
    ./app
    ./packages.nix
    ./dsearch.nix
    ./shell.nix
    ./ide
    ./yubikey.nix
    ./cli
    
  ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    sessionVariables = {
      #EDITOR = "nvim";
      XDG_CONFIG_HOME = "/home/${username}/.config";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg = {
    enable = true;
    #mimeApps = {
    #  enable = true;
    #};
  };
}
