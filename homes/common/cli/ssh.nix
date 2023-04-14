{
  programs.ssh = {
    enable = true;

  };
  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".ssh" ];
}
