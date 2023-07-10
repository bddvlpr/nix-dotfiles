let
  agenix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHLFbiC9pktQRYG44SknPbjKQvfR+KkdBqYJgonwEyLe bddvlpr@agenix";
  users = [agenix];

  systems = [];
in {
  "spotify-username.age".publicKeys = users ++ systems;
  "spotify-password.age".publicKeys = users ++ systems;

  "github-notifications.age".publicKeys = users ++ systems;
}
