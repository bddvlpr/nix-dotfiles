{
  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/ssh"
    ];
  };
}
