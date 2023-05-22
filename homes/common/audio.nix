{ pkgs, ... }:

{
  home.packages = with pkgs; [ pamixer ];
}
