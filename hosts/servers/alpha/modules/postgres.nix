{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    initialScript = pkgs.writeText "synapse-init.sql" ''
       CREATE ROLE "matrix-synapse" WITH LOGIN PASSWORD 'synapse';
      CREATE DATABASE "matrix-synapse" WITH OWNER "matrix-synapse"
        TEMPLATE template0
      	LC_COLLATE = "C"
      	LC_CTYPE = "C";
    '';
  };
}
