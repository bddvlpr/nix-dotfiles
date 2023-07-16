{config, ...}: {
  services.spotifyd = {
    enable = true;

    settings = {
      global = {
        username_cmd = "cat ${config.age.secrets.spotify-username.path}";
        password_cmd = "cat ${config.age.secrets.spotify-password.path}";
      };
    };
  };
}
