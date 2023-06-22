{inputs, ...}: {
  imports = [inputs.aagl.nixosModules.default];

  networking.mihoyo-telemetry.block = true;
}
