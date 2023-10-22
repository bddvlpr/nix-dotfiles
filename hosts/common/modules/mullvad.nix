{
  services.mullvad-vpn.enable = true;

  environment.persistence."/nix/persist".directories = ["/etc/mullvad-vpn"];
}
