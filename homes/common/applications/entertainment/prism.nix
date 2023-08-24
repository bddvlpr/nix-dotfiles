{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      prismlauncher
    ];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".local/share/PrismLauncher"
    ];
  };
}
