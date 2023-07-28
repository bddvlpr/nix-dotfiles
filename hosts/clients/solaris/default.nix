{
  inputs,
  outputs,
  config,
  ...
}: {
  imports = [
    ../../common
    ../../common/modules/audio.nix
    ../../common/modules/bluetooth.nix
    ../../common/modules/client.nix
    ../../common/modules/docker.nix
    ../../common/modules/nvidia.nix
    ../../common/modules/xdg.nix
    ./hardware.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking.hostName = "solaris";
}
