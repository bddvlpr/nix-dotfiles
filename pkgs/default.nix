{pkgs ? (import ../nixpkgs.nix) {}}: {
  # TODO: While https://github.com/NixOS/nixpkgs/pull/234279 is in PR...
  vrc-get = pkgs.callPackage ./vrc-get.nix {};
  proton-ge-custom = pkgs.callPackage ./proton-ge-custom.nix {};
}
