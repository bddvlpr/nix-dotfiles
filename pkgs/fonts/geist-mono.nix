{
  lib,
  stdenvNoCC,
  fetchzip,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "geist-mono";
  version = "1.1.0";

  src = fetchzip {
    url = "https://github.com/vercel/geist-font/releases/download/${version}/Geist.Mono.zip";
    hash = "sha256-8I4O2+bJAlUiDIhbyXzAcwXP5qpmHoh4IfrFio7IZN8=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 Geist.Mono/*.woff2 -t $out/share/fonts/woff2
    install -Dm644 Geist.Mono/*.otf -t $out/share/fonts/opentype

    runHook postInstall
  '';

  meta = {
    description = "Font family created by Vercel in collaboration with Basement Studio";
    homepage = "https://vercel.com/font";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
}
