{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = false;
    withNodeJs = false;
    withRuby = false;

    plugins = with pkgs.vimPlugins; [
      presence-nvim
    ];
  };

  home.sessionVariables.EDITOR = "nvim";
}
