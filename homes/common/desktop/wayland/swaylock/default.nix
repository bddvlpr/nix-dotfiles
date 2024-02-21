{
  pkgs,
  config,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      font = config.stylix.fonts.sansSerif.name;
      screenshots = true;
      clock = true;
      show-failed-attempts = true;
      indicator-idle-visible = true;
      effect-blur = "8x5";
    };
  };
 
  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = "${config.programs.swaylock.package}/bin/swaylock";
      }
    ];

    timeouts = [
      {
        timeout = 60 * 2;
        command = "${config.programs.swaylock.package}/bin/swaylock";
      }
    ];
  };
}
