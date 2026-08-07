{ config, pkgs, inputs, ... }:

{
  home.username = "septanto";
  home.homeDirectory = "/home/septanto";

  # This value determines the Home Manager release compatible with
  # your config. Do not change unless you know what you're doing.
  home.stateVersion = "26.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
  };

  programs.noctalia = {
      enable = true;
      systemd.enable = true;
  };

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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    # optional but nice: persistent history
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  home.packages = with pkgs; [
    bibata-cursors
    btop
    candy-icons
    clang
    clang-tools
    fzf
    lldb
    lxappearance
    nautilus
    neovim
    nixd
    opencode
    qimgv
    ripgrep
    tree-sitter
    yazi
  ];

  gtk = {
    enable = true;
    iconTheme = {
        name = "candy-icons";
        package = pkgs.candy-icons;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  xdg.configFile."kitty" = {
    source = ./dotfiles/kitty;
    recursive = true;
  };
  xdg.configFile."niri" = {
    source = ./dotfiles/niri;
    recursive = true;
  };
  xdg.configFile."nvim" = {
    source = ./dotfiles/nvim;
    recursive = true;
  };
}
