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
      spotify-username.file = ./spotify-username.age;
      spotify-password.file = ./spotify-password.age;
    };

    identityPaths = [
      "${config.home.homeDirectory}/.ssh/agenix"
    ];
  };
}
