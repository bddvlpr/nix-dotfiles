{pkgs, ...}: {
  home = {
    packages = let
      plugins = [
        "nixidea"
        pkgs.jetbrains-plugin-lombok
        pkgs.jetbrains-plugin-sonarlint
        pkgs.jetbrains-plugin-docker
      ];
    in
      with pkgs; [
        (jetbrains.plugins.addPlugins jetbrains.idea-ultimate plugins)
        (jetbrains.plugins.addPlugins jetbrains.idea-community plugins)
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
