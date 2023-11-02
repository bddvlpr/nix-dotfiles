{
  pkgs,
  inputs,
  ...
}: {
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

    # Misc
    bluetuith
    gnupg
    inputs.deploy-rs.packages.${pkgs.system}.default
  ];
}
