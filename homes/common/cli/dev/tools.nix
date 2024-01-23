{
  pkgs,
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
  ];

  home.persistence."/nix/persist/home/bddvlpr".directories = [".cargo" ".nuget"];
}
