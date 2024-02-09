{pkgs ? (import ../nixpkgs.nix) {}}: {
  geist = pkgs.callPackage ./fonts/geist.nix {};
  geist-mono = pkgs.callPackage ./fonts/geist-mono.nix {};
  geist-nf = pkgs.callPackage ./fonts/geist-nf.nix {};
  proton-ge-custom = pkgs.callPackage ./entertainment/proton-ge-custom.nix {};
  mpv-discord = pkgs.callPackage ./media/mpv-discord.nix {};
  brcm = pkgs.callPackage ./firmware/brcm.nix {};
  jdtls = pkgs.callPackage ./lsp/jdtls.nix {};

  jetbrains-plugin-lombok = pkgs.callPackage ./editors/jetbrains-plugin-lombok.nix {};
  jetbrains-plugin-sonarlint = pkgs.callPackage ./editors/jetbrains-plugin-sonarlint.nix {};
  jetbrains-plugin-docker = pkgs.callPackage ./editors/jetbrains-plugin-docker.nix {};
}
