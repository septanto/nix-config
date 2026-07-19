{ config, pkgs, inputs, ... }:

{
  home.username = "septanto";
  home.homeDirectory = "/home/septanto";

  # This value determines the Home Manager release compatible with
  # your config. Do not change unless you know what you're doing.
  home.stateVersion = "26.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "septanto";
        email = "s.s.adi.nugroho@gmail.com";
      };
    };
    signing = {
      key = "/home/septanto/.ssh/id_ed25519.pub";
      signByDefault = true;
      format = "ssh";
    };

  };

  home.packages = with pkgs; [
    neovim
    yazi
  ];

  xdg.configFile."nvim" = {
    source = ./dotfiles/nvim;
    recursive = true;
  };
}
