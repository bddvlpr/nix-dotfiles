{pkgs, ...}: let
  audioFiles = pkgs.fetchFromGitHub {
    owner = "kekrby";
    repo = "t2-better-audio";
    rev = "e46839a28963e2f7d364020518b9dac98236bcae";
    hash = "sha256-x7K0qa++P1e1vuCGxnsFxL1d9+nwMtZUJ6Kd9e27TFs=";
  };

  overrideAudioFiles = package: plugins:
    package.overrideAttrs (new: old: {
      preConfigurePhases = old.preConfigurePhases or [] ++ ["postPatchPhase"];
      postPatchPhase = ''
        cp -r ${audioFiles}/files/{profile-sets,paths} ${plugins}/alsa/mixer/
      '';
    });
in {
  boot.kernelParams = ["pcie_ports=compat" "intel_iommu=on" "iommu=pt"];

  services.udev.extraRules = builtins.readFile (pkgs.substitute {
    src = "${audioFiles}/files/91-audio-custom.rules";
    replacements = ["--replace" "/usr/bin/sed" "${pkgs.gnused}/bin/sed"];
  });

  hardware.pulseaudio.package = overrideAudioFiles pkgs.pulseaudio "src/modules/";

  services.pipewire = rec {
    package = overrideAudioFiles pkgs.pipewire "spa/plugins/";

    wireplumber.package = pkgs.wireplumber.override {
      pipewire = package;
    };
  };
}
