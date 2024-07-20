{
  description = "sacmi5's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
      config.allowUnfree = true;

      pkgs-unstable = import nixpkgs-unstable { inherit system config; };
    in {
      nixosConfigurations = {
        workstation = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system pkgs-unstable; };
          modules = [
            ./workstation/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.sacmi5 = import ./homes/sacmi5.nix;

              home-manager.extraSpecialArgs = { unstable = pkgs-unstable; };

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
          ];
        };
      };
      /* homeConfigurations.sacmi5 = home-manager.lib.homeManagerConfiguration {
              extraSpecialArgs = {
                unstable = pkgs-unstable;
              };
              modules = [ ./homes/sacmi5.nix ];

              inherit pkgs;
            };
      */
    };
}
