{ inputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ./cli
    ./applications
  ];
}
