{pkgs, inputs, ...}: {
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
    gnupg
		inputs.deploy-rs.packages.${pkgs.system}.default
  ];
}
