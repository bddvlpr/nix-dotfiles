{
  # TODO: awaiting PR https://github.com/NixOS/nixpkgs/issues/263445
  #services.mullvad-vpn.enable = true;

  environment.persistence."/nix/persist".directories = ["/etc/mullvad-vpn"];
}
