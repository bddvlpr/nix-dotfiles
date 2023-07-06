{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [blender];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/blender"];
  };
}
