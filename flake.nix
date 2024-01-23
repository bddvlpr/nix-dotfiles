{
  description = "Luna's NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    hyprwm-hyprland.url = "github:hyprwm/hyprland";
    hyprwm-hyprland.inputs.nixpkgs.follows = "nixpkgs";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    hyprwm-contrib.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";
    hardware.url = "github:nixos/nixos-hardware";

    stylix.url = "github:bluskript/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    untis-ics-sync.url = "github:bddvlpr/untis-ics-sync/v0.5.9";
    untis-ics-sync.inputs.nixpkgs.follows = "nixpkgs";

    nix-spicetify.url = "github:the-argus/spicetify-nix";
    nix-spicetify.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
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
      "x86_64-linux"
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
    };
  };
}
