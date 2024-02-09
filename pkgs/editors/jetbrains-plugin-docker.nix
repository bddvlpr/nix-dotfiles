{
  stdenv,
  fetchzip,
}:
stdenv.mkDerivation rec {
  name = "jetbrains-plugin-docker";
  version = "233.14475.8";

  src = fetchzip {
    url = "https://plugins.jetbrains.com/files/7724/484858/clouds-docker-impl-${version}.zip";
    hash = "sha256-hPKznNot57pBp7+KJAg0+sUTVphgLsA4+LIqBn5Ln5s=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out && cp -r . $out
    runHook postInstall
  '';
}
