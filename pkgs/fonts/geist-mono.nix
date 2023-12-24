{
  lib,
  stdenvNoCC,
  fetchzip,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "geist-mono";
  version = "1.0.1";

  src = fetchzip {
    url = "https://github.com/vercel/geist-font/releases/download/${version}/Geist-Mono.zip";
    hash = "sha256-miI3On1YG3FJqoDcSoMnyVXpJIFcQtfuKV0F+6IkM7w=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.woff2 -t $out/share/fonts/woff2

    runHook postInstall
  '';

  meta = {
    description = "Font family created by Vercel in collaboration with Basement Studio";
    homepage = "https://vercel.com/font";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
}