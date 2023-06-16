{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./media/cava.nix

    # Shells
    ./fish.nix
    ./zsh.nix

    # Tools
    ./ssh.nix
    ./git.nix

    # Indexing
    ./nix-index.nix
  ];

  home.packages = with pkgs; [
    comma
    ncdu
    htop
    neofetch
    inputs.agenix.packages.${system}.default
  ];
}
