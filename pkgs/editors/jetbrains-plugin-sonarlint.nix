{
  stdenv,
  fetchzip,
}:
stdenv.mkDerivation rec {
  name = "jetbrains-plugin-sonarlint";
  version = "10.3.0.77475";

  src = fetchzip {
    url = "https://plugins.jetbrains.com/files/7973/478219/sonarlint-intellij-${version}.zip";
    hash = "sha256-6LDKVFM9BPMBv6BqvuGSp/JzeFvHfUOHFWDSPoO/Ze8=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out && cp -r . $out
    runHook postInstall
  '';
}
