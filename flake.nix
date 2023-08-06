{
  description = "Luna's NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs.url = "github:serokell/deploy-rs";

    hyprwm-hyprland.url = "github:hyprwm/hyprland/9654749244117f7f150c6f2a2ce4dede6e8cbb25";
    hyprwm-contrib.url = "github:hyprwm/contrib/bef073cff65917ba2d888aa4dc39bd9868e2b0a4";

    impermanence.url = "github:nix-community/impermanence";
    hardware.url = "github:nixos/nixos-hardware";
    agenix.url = "github:ryantm/agenix";

    nix-spicetify.url = "github:the-argus/spicetify-nix";
    nix-index-database.url = "github:mic92/nix-index-database";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    deploy-rs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    mkSystem = modules:
      nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = {inherit inputs outputs;};
      };
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in
      import ./pkgs {inherit pkgs;});

    devShells = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in
      import ./shell.nix {inherit pkgs;});

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      dissension = mkSystem [./hosts/clients/dissension];
      solaris = mkSystem [./hosts/clients/solaris];
      aurora = mkSystem [./hosts/clients/aurora];

      alpha = mkSystem [./hosts/servers/alpha];
    };

    deploy.nodes = let
      mkNode = hostname: path: {
        inherit hostname;
        profiles = {
          system = {inherit path;};
        };
      };
    in {
      alpha = mkNode "alpha" (deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.alpha);
    };

    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
  };
}
