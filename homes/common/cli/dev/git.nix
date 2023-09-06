{
  pkgs,
  config,
  ...
}: let
  identity = import ../../../../identities/bddvlpr.nix;
in {
  programs.git = {
    enable = true;
    userName = identity.fullName;
    userEmail = identity.email;

    package = pkgs.gitFull;

    signing = {
      key = identity.gpgKey;
      signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential.helper = "${config.programs.git.package}/bin/git-credential-libsecret";
    };
  };
}
