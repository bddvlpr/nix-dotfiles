{
  containers.nextcloud = {
    autoStart = true;
    ephemeral = true;

    forwardPorts = [
      {
        containerPort = 80;
        hostPort = 80;
      }
    ];

    bindMounts = {
      "/var/lib/postgresql" = {
        hostPath = "/opt/nextcloud";
        isReadOnly = false;
      };
    };

    config = {
      pkgs,
      config,
      ...
    }: {
      services = {
        nextcloud = {
          enable = true;

          hostName = "localhost";
          database.createLocally = true;

          config = {
            dbtype = "pgsql";

            adminuser = "bddvlpr";
            adminpassFile = toString (pkgs.writeText "nextcloud-admin-password" "changeme");
          };

          extraApps = with config.services.nextcloud.package.packages.apps; {
            inherit contacts calendar;
          };
          extraAppsEnable = true;
        };
      };
    };
  };

  environment.persistence."/nix/persist".directories = ["/opt/nextcloud"];
}
