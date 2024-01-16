{pkgs, ...}: {
  home.packages = [
    (pkgs.mpv.override {
      scripts = [pkgs.mpv-discord];
    })
  ];
}
