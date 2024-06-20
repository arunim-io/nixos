{ pkgs, ... }:
{
  home.stateVersion = "24.11";
  programs.git.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
  };
  programs.wofi.enable = true;
  programs.foot.enable = true;
  programs.lazygit.enable = true;
}
