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
    solaris = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGO+uT+Htg4wwSREfUCMutIp1J9FCicwAPjj7M7utuft bddvlpr@solaris";
      sshSystemKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGGTNFMqA9s6LKiAAP9eBI0xEjkPd15AorlXYVzB/ppn root@solaris";
      sshAgenixKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGzVWscxdUWpdU5w6p8z2TqarueQ85vOtpyoirZQ7ar4 bddvlpr@solaris[agenix]";
    };

    alpha = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIME5edDoHMcLJvX4jXnGmxkMo831hdy7SVuQQxdH1VHc bddvlpr@alpha";
      sshSystemKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEpYYd0Fdb9g3VwELNoUkIBzNlN00H6hUVGSq85yAdb0 root@alpha";
      sshAgenixKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICSd2RQXyAzJdAyq4e+fUmVwuFoHlPx0D2gWghdfK6nN bddvlpr@alpha[agenix]";
    };
  };

  userKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshUserKey) hosts);
  systemKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshSystemKey) hosts);
  agenixKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshAgenixKey) hosts);
  allKeys = builtins.concatLists [userKeys systemKeys agenixKeys];
}
