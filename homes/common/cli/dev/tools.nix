{pkgs, ...}: {
  home.packages = with pkgs; [
    # Rust
    rustc
    cargo
    cargo-tauri
    rustfmt

    # NodeJS
    nodejs
    yarn
    nodePackages.pnpm
  ];
}
