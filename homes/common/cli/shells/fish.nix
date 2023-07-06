{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      n = "nix";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";
      nr = "nix run";

      snr = "sudo nixos-rebuild --flake /etc/nixos";
      snrs = "sudo nixos-rebuild --flake /etc/nixos switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";
    };

    shellInit = ''
      set fish_greeting
      export TERM=xterm-256color
    '';
  };
}
