{
  fetchFromGitHub,
  fetchurl,
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "brcm";

  src = fetchFromGitHub {
    owner = "j3ffyang";
    repo = "mbp-fedora";
    rev = "99402df7335afe2bb67474a3d8a5a3ee35f05271";
    hash = "sha256-JTNU38xeGXDmOdMCVNX+zQKEo71ynsADqV+GeOgK7Sg=";
  };

  buildCommand = ''
    target="$out/lib/firmware"
    mkdir -p "$target"
    cp -r $src/brcm $target
  '';
}
