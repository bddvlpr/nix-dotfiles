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

    hyprland.url = "github:hyprwm/hyprland/51a930f802c71a0e67f05e7b176ded74e8e95f87";
    hyprwm-contrib.url = "github:hyprwm/contrib/2e2ecbe931dd800ca7374642583fc98ce19c42c6";

    impermanence.url = "github:nix-community/impermanence";
    hardware.url = "github:nixos/nixos-hardware";
    agenix.url = "github:ryantm/agenix";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
  in rec {
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
