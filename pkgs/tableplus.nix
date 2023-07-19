{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  name = "TablePlus";
  version = "0.1.216";

  libldapSrc = pkgs.fetchurl {
    url = "http://ftp.de.debian.org/debian/pool/main/o/openldap/libldap-2.4-2_2.4.59+dfsg-1~bpo11+1_amd64.deb";
    sha256 = "0zcxbanvr60x4xaxaaspal20lf970qwis57c3angy3795abysdm6";
  };

  libsaslSrc = pkgs.fetchurl {
    url = "http://archive.ubuntu.com/ubuntu/pool/main/c/cyrus-sasl2/libsasl2-2_2.1.27+dfsg-2_amd64.deb";
    sha256 = "3OguEgUoKpB8lvlzUItzB7imn6Td46+Sl+YCFXM/LTA=";
  };

  tableplusSrc = pkgs.fetchurl {
    url = "https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${version}_amd64.deb";
    sha256 = "01cgy7s2kmw0862a8yifv0j5710wrfxhg3v56x24yfbri353k9v2";
  };

  unpackPhase = ''
    runHook preUnpack
    dpkg-deb -x $tableplusSrc tableplus
    dpkg-deb -x $libldapSrc libldap
    dpkg-deb -x $libsaslSrc libsasl
    runHook postUnpack
  '';

  installPhase = ''
       runHook preInstall
       mkdir -p "$out/lib"
       mkdir -p "$out/bin"
       mkdir -p "$out/resource"
       # deps
       cp -R libldap/usr/lib/x86_64-linux-gnu/* "$out/lib/"
       cp -R libsasl/usr/lib/x86_64-linux-gnu/* "$out/lib/"
       # tableplus
       cp -R "tableplus/opt/tableplus/tableplus" "$out/bin/tableplus"
       cp -R "tableplus/opt/tableplus/resource/" "$out/resource"
       chmod -R g-w "$out"
    runHook postInstall
  '';

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    dpkg
    makeWrapper
    wrapGAppsHook
    copyDesktopItems
  ];

  buildInputs = with pkgs; [
    gtksourceview
    gtksourceview4
    json-glib
    libgee
    libkrb5
    libsecret
    openldap
    stdenv.cc.cc.lib
  ];

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "TablePlus";
      exec = "tableplus";
      desktopName = "TablePlus";
    })
  ];

  meta = {
    description = "Tableplus";
    homepage = "https://tableplus.com/";
    platforms = ["x86_64-linux"];
  };
}
