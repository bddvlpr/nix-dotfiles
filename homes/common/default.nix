{
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      inputs.impermanence.nixosModules.home-manager.impermanence
      ./theme.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/apng" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/webp" = "imv.desktop";

      "video/mp4" = "mpv.desktop";
      "video/mpv" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
    };
  };

  programs.home-manager.enable = true;
}
