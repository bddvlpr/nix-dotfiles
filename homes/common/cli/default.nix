{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./media/cava.nix
    ./media/spotify-tui.nix
    ./shells/fish.nix
    ./shells/zsh.nix
    ./dev/git.nix
    ./dev/ssh.nix
    inputs.nix-index-database.hmModules.nix-index
  ];

  home.packages = with pkgs; [
    comma
    ncdu
    htop
    neofetch
    inputs.agenix.packages.${system}.default
  ];

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
}
