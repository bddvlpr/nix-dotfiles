{ pkgs, ... }:

{
  imports = [
    # Shells
    ./fish.nix
    ./zsh.nix

    # Tools
    ./ssh.nix
    ./git.nix

    # Indexing
    ./nix-index.nix
  ];

  home.packages = with pkgs; [ comma ncdu htop neofetch ];
}
