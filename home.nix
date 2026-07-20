{ config, pkgs, inputs, ... }:

{
  home.username = "septanto";
  home.homeDirectory = "/home/septanto";

  # This value determines the Home Manager release compatible with
  # your config. Do not change unless you know what you're doing.
  home.stateVersion = "26.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  programs.kitty = {
    shellIntegration.enableZshIntegration = true;
    settings = {
        enable_audio_bell = false;
        hide_window_decorations = "titlebar-only";
    };
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
    clang
    clang-tools
    fuzzel
    fzf
    lldb
    neovim
    nixd
    ripgrep
    tree-sitter
    yazi
  ];

  xdg.configFile."nvim" = {
    source = ./dotfiles/nvim;
    recursive = true;
  };
}
