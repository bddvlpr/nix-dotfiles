{
  lib,
  stdenvNoCC,
  fetchzip,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "geist-nf";
  version = "3.1.1";

  src = fetchzip {
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/GeistMono.zip";
    hash = "sha256-GzWly6hGshy8DYZNweejvPymcxQSIU7oGUmZEhreMCM=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.otf -t $out/share/fonts/opentype

    runHook postInstall
  '';

  meta = {
    description = "Font family created by Vercel in collaboration with Basement Studio";
    homepage = "https://vercel.com/font";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
}
