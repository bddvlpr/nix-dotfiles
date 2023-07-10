{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.agenix.homeManagerModules.age
  ];

  config.age = {
    secrets = {
      spotify-username.file = ./spotify/spotify-username.age;
      spotify-password.file = ./spotify/spotify-password.age;

      github-notifications.file = ./github/github-notifications.age;
    };

    identityPaths = [
      "${config.home.homeDirectory}/.ssh/agenix"
    ];
  };
}
