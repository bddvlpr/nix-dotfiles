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

    bravo = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0svvdhLwCk1F4pXA3y9w1284D3YNFj8oDnBF3k2mNa bddvlpr@bravo";
      sshSystemKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJcSG0hMBdVxcKA3Fy9ovL3KKMwMRl0Qs2SvmpsxvbWN root@bravo";
      sshAgenixKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEbO8LWTVC8aDSJCbNbkAvUIWmGas2FBhNlSScd/caNo bddvlpr@bravo[agenix]";
    };

    charlie = {
      sshUserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKPNXCdpvkaqpInYtzwONI3GADT/ZBKfrXSbf0iVXQSo bddvlpr@charlie";
      sshSystemKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHsWoNfdGR2JQSutgKBrb0ODUSduzGNZhz0uUmZM5ZD/ root@charlie";
      sshAgenixKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILQEJqfcV2b6ocwA/EaPhBWThaX4v9Bn+awoM+GrNlyE bddvlpr@charlie[agenix]";
    };
  };

  userKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshUserKey) hosts);
  systemKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshSystemKey) hosts);
  agenixKeys = builtins.attrValues (builtins.mapAttrs (host: config: config.sshAgenixKey) hosts);
  allKeys = builtins.concatLists [userKeys systemKeys agenixKeys];
}
