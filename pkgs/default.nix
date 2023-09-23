{pkgs ? (import ../nixpkgs.nix) {}}: {
  proton-ge-custom = pkgs.callPackage ./entertainment/proton-ge-custom.nix {};
}
