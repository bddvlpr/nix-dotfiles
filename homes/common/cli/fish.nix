{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      n = "nix";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";

      nr = "nixos-rebuild --flake .";
      nrs = "nixos-rebuild --flake . switch";
      snr = "sudo nixos-rebuild --flake .";
      snrs = "sudo nixos-rebuild --flake . switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";

      code = "codium";
    };

    shellInit = ''
      set fish_greeting
    '';
  };
}
