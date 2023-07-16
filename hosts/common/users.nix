{
  pkgs,
  ...
}: {
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      bddvlpr = {
        passwordFile = "/nix/persist/passwd";
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager" "docker" "video"];
      };
    };
  };

  programs.fish.enable = true;

  security.sudo.wheelNeedsPassword = false;
}
