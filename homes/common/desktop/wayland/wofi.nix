{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ wofi ];
  # TODO: styling
}
