{
  fetchurl,
  stdenvNoCC,
  ...
}: let
  firmware = fetchurl {
    url = "https://files.catbox.moe/y6pz3d.gz";
    hash = "sha256-z/lPdVfiWHWsQDTSE1mR6A5/hg7+JnbmblSXE/oyn10=";
  };
in
  stdenvNoCC.mkDerivation {
    name = "brcm";

    buildCommand = ''
      target="$out/lib/firmware"
      mkdir -p "$target"
      tar -xf ${firmware} -C $target
    '';
  }
