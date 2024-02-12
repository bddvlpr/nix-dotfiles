{
  lib,
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation rec {
  pname = "proton-ge-custom";
  version = "GE-Proton8-32";

  src = fetchurl {
    url = "https://github.com/GloriousEggroll/${pname}/releases/download/${version}/${version}.tar.gz";
    hash = "sha256-U+5CvBVWCFQRMtb7+KcaHx9Coj7cXg5V0EJd+e51PaA=";
  };

  buildCommand = ''
    mkdir -p $out/bin
    tar -C $out/bin --strip=1 -x -f $src
  '';

  meta = with lib; {
    description = "Compatibility tool for Steam Play based on Wine and additional components";
    homepage = "https://github.com/GloriousEggroll/proton-ge-custom";
    license = licenses.bsd3;
    platforms = ["x86_64-linux"];
  };
}
