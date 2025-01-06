{
  description = "A personnal NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";  
    #};
  };

  outputs = inputs @ {
      self, 
      nixpkgs,
      home-manager,
      catppuccin,
      hyprland,
      unstable,
      ... 
  }: {
    nixosConfigurations = {
      prsvbtestnix01 = let
        username = "kkroto";
        specialArgs = { inherit username; };
      in 
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          modules = [
            catppuccin.nixosModules.catppuccin
            ./hosts/prsvbtestnix01
            ./users/${username}/nixos.nix
            home-manager.nixosModules.home-manager
            {
              # home-manager.useGlobalPkgs = true;
              # home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = {
                imports = [
                  ./users/${username}/home.nix
                  catppuccin.homeManagerModules.catppuccin 
                ];
              };
            }
          ]; 
        };
    };
  };
}