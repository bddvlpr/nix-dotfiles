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
      nfu = "nix flake update";
      nr = "nix run";
      nfmt = "nix fmt";

      snr = "sudo nixos-rebuild --flake /etc/nixos";
      snrs = "sudo nixos-rebuild --flake /etc/nixos switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";
    };

    shellAliases = {
      ls = "${pkgs.eza}/bin/eza --icons -F -H --group-directories-first --git";
      cat = "${pkgs.bat}/bin/bat -pp --theme=base16";
      code = "codium";
    };

    shellInit = ''
      set fish_greeting
      export TERM=xterm-256color
    '';
  };
}
