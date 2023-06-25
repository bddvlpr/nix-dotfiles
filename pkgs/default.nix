{pkgs ? (import ../nixpkgs.nix) {}}: {
  # While https://github.com/NixOS/nixpkgs/pull/234279 is in PR...
  vrc-get = pkgs.callPackage ./vrc-get.nix {};
}
