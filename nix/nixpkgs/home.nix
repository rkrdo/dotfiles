{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ricardo";
  home.homeDirectory = "/Users/ricardo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # https://search.nixos.org/packages
  home.packages = with pkgs; [
    ctop
    gh
    git
    gnupg
    htop
    jq
    nnn
    ripgrep
    rnix-lsp
    stow
    tig
    tmux
    tree
    vim
    wget
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    dotDir = ".config/zsh";
    dirHashes = {
      dotfiles = "$HOME/.dotfiles";
    };
    enableSyntaxHighlighting = true;
    initExtra = ''
      fh() {
        print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
      }
    '';
    profileExtra = ''
      if [ -e "$HOME"/.nix-profile/etc/profile.d/nix.sh ]; then . "$HOME"/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
      # https://github.com/Homebrew/discussions/discussions/446#discussioncomment-263078
      if [ -e /opt/homebrew/bin/brew ]; then eval $(/opt/homebrew/bin/brew shellenv) ; fi
    '';
    sessionVariables = {
      EDITOR = "vim";
      VIMCONFIG = "~/.vim"; # TODO - check if needed
      VIMDATA = "~/.vim"; # TODO - check if needed
      NNN_USE_EDITOR = "1";
    };

    oh-my-zsh = {
      enable = true;
      theme = "kolo";
      plugins = ["asdf" "docker" "docker-compose" "git" "tig"];
      extraConfig = ''
        CASE_SENSITIVE="false"
      '';
    };
  };

  programs.bat = {
    enable = true;
    config.theme = "Dracula";
  };

  programs.fzf = {
    enable = true;
    defaultCommand = "rg --files --follow --hidden --no-ignore-vcs";
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = ["-p"];
    };
  };
}
