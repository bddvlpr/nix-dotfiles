{
  pkgs,
  inputs,
  ...
}: {
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Macchiato-Standard-Rosewater-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["rosewater"];
        variant = "macchiato";
      };
    };

    font = {
      name = "RobotoMono Nerd Font";
    };
  };

  dconf.enable = true;
}
