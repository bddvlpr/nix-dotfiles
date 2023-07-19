{pkgs ? (import ../nixpkgs.nix) {}}: {
  proton-ge-custom = pkgs.callPackage ./proton-ge-custom.nix {};
  tableplus = pkgs.callPackage ./tableplus.nix {};
}
