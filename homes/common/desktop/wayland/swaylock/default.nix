{pkgs, ...}: {
  programs.swaylock.enable = true;

  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];

    timeouts = [
      {
        timeout = 60 * 5;
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];
  };
}
