{
  inputs,
  outputs,
  config,
  ...
}: {
  imports = [
    ../common
    ../common/modules/audio.nix
    ../common/modules/client.nix
    ../common/modules/docker.nix
    ../common/modules/gamemode.nix
    ../common/modules/libvirtd.nix
    ../common/modules/mullvad.nix
    ../common/modules/nvidia.nix
    ../common/modules/opentabletdriver.nix
    ../common/modules/sdr.nix
    ../common/modules/thunar.nix
    ../common/modules/xdg.nix
    ./hardware.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking.hostName = "dissension";
}
