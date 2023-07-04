{
  pkgs,
  inputs,
  ...
}: {
  home = {
    packages = with inputs.nixpkgs-stable.legacyPackages.${pkgs.system}; [blender];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/blender"];
  };
}
