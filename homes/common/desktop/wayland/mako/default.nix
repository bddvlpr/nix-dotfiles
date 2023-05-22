{ config, ... }:

{
  services.mako = {
    enable = true;

    backgroundColor = "#24273a";
    textColor = "#cad3f5";
    borderColor = "#8aadf4";
    progressColor = "#363a4f";

    extraConfig = ''
      [urgency=high]
      border-color=#f5a97f'';
  };
}
