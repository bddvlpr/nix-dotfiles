{pkgs, ...}: {
  home = {
    packages = [(pkgs.discord.override {withVencord = true;})];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/discord" ".config/Vencord"];
  };
}
