{
  stdenv,
  fetchzip,
}:
stdenv.mkDerivation rec {
  name = "jetbrains-plugin-lombok";
  version = "233.14475.9";

  src = fetchzip {
    url = "https://plugins.jetbrains.com/files/6317/484109/lombok-${version}.zip";
    hash = "sha256-88MgE9dnzKxhkReUFC6IGWe0Ez6lPoyp7+QlyCJFreM=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out && cp -r . $out
    runHook postInstall
  '';
}
