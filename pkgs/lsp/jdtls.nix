{
  stdenv,
  fetchurl,
  makeWrapper,
  lib,
  jdk21_headless,
  python3Minimal,
}:
stdenv.mkDerivation rec {
  pname = "jdtls";
  version = "1.32.0";
  timestamp = "202402011424";

  src = fetchurl {
    url = "https://download.eclipse.org/jdtls/milestones/${version}/jdt-language-server-${version}-${timestamp}.tar.gz";
    sha256 = "sha256-u6Ang8B7gloapuRVUXViT0mkdFzx1py5ixWfrrVNlSU=";
  };

  nativeBuildInputs = [makeWrapper];

  buildPhase = ''
    mkdir -p jdt-language-server
    tar xfz $src -C jdt-language-server
  '';

  installPhase = ''
    mkdir -p $out/bin $out/libexec
    cp -a jdt-language-server $out/libexec
    makeWrapper $out/libexec/jdt-language-server/bin/jdtls $out/bin/jdtls \
      --set PATH ${lib.makeBinPath [jdk21_headless python3Minimal]}
  '';

  dontUnpack = true;
  dontPatch = true;
  dontConfigure = true;
}
