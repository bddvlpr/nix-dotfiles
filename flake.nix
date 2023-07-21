{
  description = "Luna's NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.05";

    # TODO: Temporary: PR in progress
    home-manager = {
      url = "github:bddvlpr/home-manager/programs/cava-add";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprwm-hyprland.url = "github:hyprwm/hyprland/b08b72358ad549fd066e5be0fc3aa4c9df367607";
    hyprwm-contrib.url = "github:hyprwm/contrib/3126196e7ed609e7c427a39dc126ea067de62a65";

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
      dissension = mkSystem [./hosts/dissension];
      solaris = mkSystem [./hosts/solaris];
      aurora = mkSystem [./hosts/aurora];
    };
  };
}
