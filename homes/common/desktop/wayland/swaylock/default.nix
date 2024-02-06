{
  pkgs,
  config,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = "${config.programs.swaylock.package}/bin/swaylock -fFS --clock --effect-blur 8x5 --indicator-idle-visible";
      }
    ];

    timeouts = [
      {
        timeout = 60 * 5;
        command = "${config.programs.swaylock.package}/bin/swaylock -fFS --clock --effect-blur 8x5 --indicator-idle-visible";
      }
    ];
  };
}
