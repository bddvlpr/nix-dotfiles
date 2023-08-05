let
  identity = import ../identities/bddvlpr;

  keys = identity.systemKeys ++ identity.agenixKeys;
in {
  "users/bddvlpr.age".publicKeys = keys;
  "github/notifications.age".publicKeys = keys;
}
