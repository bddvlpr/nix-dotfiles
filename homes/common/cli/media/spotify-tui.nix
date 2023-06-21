{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [spotify-tui];

    file."${config.xdg.configHome}/spotify-tui/client.yml" = {
      text = ''
        ---
        client_id: @client_id@
        client_secret: @client_secret@
        device_id: ~
        port: 8888
      '';
      force = true;
    };

    activation = {
      "spotify-tui-secrets" = let
        secrets = config.age.secrets;
      in
        lib.hm.dag.entryAfter ["writeBoundary"] ''
          client_id=$(cat "${secrets.spotify-tui-client-id.path}")
          client_secret=$(cat "${secrets.spotify-tui-client-secret.path}")
          sed -i "s/@client_id@/$client_id/" "${config.xdg.configHome}/spotify-tui/client.yml"
          sed -i "s/@client_secret@/$client_secret/" "${config.xdg.configHome}/spotify-tui/client.yml"
        '';
    };
  };
}
