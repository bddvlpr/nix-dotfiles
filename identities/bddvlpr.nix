rec {
  firstName = "Luna";
  lastName = "Simons";
  fullName = "${firstName} ${lastName}";

  email = "luna@bddvlpr.com";

  hosts = {
    dissension = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgZVPZ2+cqT1seskNMDRtb8x+W6XkJBl9w8ZkqzkWP8 bddvlpr@dissension";
      sshSystemKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVkIo1vEJg+Qh7/joiP9od7SGoutgNtmQzI9yqL9bLo root@dissension";
      sshAgenixKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBNBRmEob6GMOVWNC6LAwaqXJN7lEBcTCB0y9sxftkX8 bddvlpr@dissension[agenix]";
    };
  };

  userKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshUserKey) hosts);
  systemKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshSystemKey) hosts);
  agenixKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshAgenixKey) hosts);
  allKeys = builtins.concatLists [userKeys systemKeys agenixKeys];
}
