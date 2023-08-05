{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.agenix.homeManagerModules.default
  ];

  config.age = {
    secrets = {
      github-notifications.file = ./github/notifications.age;
    };

    identityPaths = [
      "${config.home.homeDirectory}/.ssh/id_ed25519"
      "${config.home.homeDirectory}/.ssh/id_rsa"
      "${config.home.homeDirectory}/.ssh/id_ed25519_agenix"
    ];
  };
}
