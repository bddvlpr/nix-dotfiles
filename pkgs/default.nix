{pkgs ? (import ../nixpkgs.nix) {}}: {
  proton-ge-custom = pkgs.callPackage ./proton-ge-custom.nix {};
}
