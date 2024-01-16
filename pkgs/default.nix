{pkgs ? (import ../nixpkgs.nix) {}}: {
  geist = pkgs.callPackage ./fonts/geist.nix {};
  geist-mono = pkgs.callPackage ./fonts/geist-mono.nix {};
  geist-nf = pkgs.callPackage ./fonts/geist-nf.nix {};
  proton-ge-custom = pkgs.callPackage ./entertainment/proton-ge-custom.nix {};
  mpv-discord = pkgs.callPackage ./media/mpv-discord.nix {};
}
