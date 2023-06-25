{pkgs, ...}: {
  home.packages = with pkgs; [
    # Rust
    rustc
    cargo

    # NodeJS
    nodejs
    yarn
    nodePackages.pnpm
  ];
}
