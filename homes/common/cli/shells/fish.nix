{pkgs, ...}: {
  home.packages = with pkgs; [exa];

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

    shellAliases = {
      ls = "exa --icons -F -H --group-directories-first --git";
    };

    shellInit = ''
      set fish_greeting
      export TERM=xterm-256color
    '';
  };
}
