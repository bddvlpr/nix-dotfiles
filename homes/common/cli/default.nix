{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./cloud/hetzner.nix
    ./cloud/talosctl.nix
    ./editors/helix
    ./editors/neovim
    ./shells/fish.nix
    ./shells/starship.nix
    ./shells/zsh.nix
    ./dev/direnv.nix
    ./dev/git.nix
    ./dev/gpg.nix
    ./dev/sops.nix
    ./dev/ssh.nix
    ./dev/tools.nix
    inputs.nix-index-database.hmModules.nix-index
  ];

  home.packages = with pkgs; [
    comma
    ncdu
    htop
    neofetch
  ];

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
}
