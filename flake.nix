{
  description = "A personnal NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
      self, 
      nixpkgs,
      home-manager,
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
            ./hosts/prsvbtestnix01
            ./users/${username}/nixos.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ]; 
        };
      prskvmtestnix01 = let
        username = "kkroto";
        specialArgs = { inherit username; };
      in 
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          modules = [
            ./hosts/prskvmtestnix01
            ./users/${username}/nixos.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ]; 
        };
    };
  };
}