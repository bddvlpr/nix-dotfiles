{
  pkgs,
  inputs,
  ...
}: {
  home = {
    # TODO: https://github.com/NixOS/nixpkgs/issues/241125
    packages = with inputs.nixpkgs-stable.legacyPackages.${pkgs.system}; [blender];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/blender"];
  };
}
