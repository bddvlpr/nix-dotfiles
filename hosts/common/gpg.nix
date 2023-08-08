{pkgs, ...}: {
  environment.systemPackages = with pkgs; [pinentry-curses];

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  services.pcscd.enable = true;
}
