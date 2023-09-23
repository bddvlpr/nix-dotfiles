{
  pkgs,
  lib,
  ...
}: let
  runescape = pkgs.runescape.overrideAttrs (old: {
    nativeBuildInputs =
      (old.nativeBuildInputs or [])
      ++ [
        pkgs.makeWrapper
      ];

    buildCommand =
      (old.buildCommand or "")
      + ''
        wrapProgram "$out/bin/RuneScape" \
          --set PULSE_LATENCY_MSEC 100 \
          --run 'echo $PULSE_LATENCY_MSEC'
      '';
  });
  openssl = lib.head (lib.filter (p: p.pname == "openssl") runescape.fhsenv.targetPaths);
in {
  home = {
    packages = [runescape];

    persistence."/nix/persist/home/bddvlpr" = {
      allowOther = true;
      directories = ["Jagex"];
    };
  };
  nixpkgs.config.permittedInsecurePackages = [openssl.name];
}
