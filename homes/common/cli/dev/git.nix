{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Luna Simons";
    userEmail = "luna@bddvlpr.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential.helper = "${pkgs.git.override {withLibsecret = true;}}/bin/git-credential-libsecret";
    };
  };
}
