rec {
  firstName = "Luna";
  lastName = "Simons";
  fullName = "${firstName} ${lastName}";

  email = "luna@bddvlpr.com";

  gpgKey = "42EDAE8164B99C3A4B835711AB69B6F3380869A8";

  hosts = {
    dissension = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgZVPZ2+cqT1seskNMDRtb8x+W6XkJBl9w8ZkqzkWP8 bddvlpr@dissension";
      sshSystemKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVkIo1vEJg+Qh7/joiP9od7SGoutgNtmQzI9yqL9bLo root@dissension";
    };

    solaris = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGO+uT+Htg4wwSREfUCMutIp1J9FCicwAPjj7M7utuft bddvlpr@solaris";
      sshSystemKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGGTNFMqA9s6LKiAAP9eBI0xEjkPd15AorlXYVzB/ppn root@solaris";
    };
  };

  userKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshUserKey) hosts);
  systemKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshSystemKey) hosts);
  allKeys = builtins.concatLists [userKeys systemKeys];
}
