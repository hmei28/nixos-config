{
  inputs,
  nixpkgs,
  system,
  pkgs,
  lib,
  self,
}:
let
  inherit (inputs) home-manager hyprland;

  # Mapping machines → users
  machines = {
    prsdkplnv01 = [ "kkroto" ];
    # workibast = [ "workibast" ];
  };

  mkHost = hostname: usernames: let
    primaryUser = builtins.head usernames;

    specialArgs = {
      inherit hostname usernames inputs self lib;
      username = primaryUser;
    };
  in
    nixpkgs.lib.nixosSystem {
      inherit system specialArgs;

      modules = [
        {
          networking.hostName = lib.mkForce hostname;
        }
        ./${hostname}
        self.nixosModules.default
        inputs.dms.nixosModules.dank-material-shell

        # Home-manager
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = {
            inherit inputs specialArgs;
            username = primaryUser;
          };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Configure home-manager for each user
          home-manager.users = builtins.listToAttrs (
            map (username: {
              name = username;
              value = {
                imports = [
                  ../homes/${username}
                  self.homeModules.default
                  inputs.dms.homeModules.dank-material-shell
                  inputs.dms-plugin-registry.homeModules.dms-plugin-registry
                  inputs.sops-nix.homeManagerModules.sops
                  inputs.zen-browser.homeModules.twilight
                  inputs.nix-index-database.homeModules.default
                ];
              };
            }) usernames
          );
        }
      ];
    };
in
  nixpkgs.lib.mapAttrs mkHost machines
