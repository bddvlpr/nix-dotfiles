{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      jetbrains.idea-ultimate
      jetbrains.idea-community
      jdk21
    ];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".jdks"
      ".m2"
      ".cache/JetBrains"
      ".config/JetBrains"
      ".local/share/JetBrains"
    ];
  };
}
