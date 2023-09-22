{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [".local/share/direnv"];
}
