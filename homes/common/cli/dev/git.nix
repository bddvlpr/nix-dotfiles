{
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Luna Simons";
    userEmail = "luna@bddvlpr.com";

    package = pkgs.git.override {withLibsecret = true;};

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential.helper = "${config.programs.git.package}/bin/git-credential-libsecret";
    };
  };
}
