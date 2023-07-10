{pkgs, ...}: {
  programs.rofi = {
    enable = true;

    theme = ./theme.rasi;
    extraConfig = {
      modi = "run,drun,window,ssh";
      icon-theme = "Oranchelo";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = "   Window";
      display-ssh = " 󰣀  SSH";
      sidebar-mode = true;
    };
  };
}
