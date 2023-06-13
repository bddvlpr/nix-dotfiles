# Convert config.monitors into hyprland's format
# Author: Misterio77 (https://github.com/Misterio77)
{
  lib,
  monitors,
}: let
  enabledMonitors = lib.filter (m: m.enabled) monitors;
in
  lib.concatStringsSep "\n" (lib.forEach enabledMonitors (m: ''
    monitor=${m.name},${toString m.width}x${toString m.height}@${toString m.refreshRate},${toString m.x}x${toString m.y},${toString m.scale}
    ${lib.optionalString (m.workspace != null) "workspace=${m.name},${m.workspace}"}
  ''))
