{ config, pkgs, ... }:

let
  homeDir = config.home.homeDirectory;
in {
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
    asdf-vm
    ctop
    gh
    gnupg
    htop
    jq
    nnn
    ripgrep
    rnix-lsp
    stow
    tig
    tree
    wget
  ];

  home.file.".ideavimrc".text = ''
    imap jk <Esc>
    set ideajoin

    # https://www.dev-log.me/VimtelliJ:_All_the_best_of_Vim_in_IntelliJ/
    set surround
    nnoremap <leader>y :action PasteMultiple<CR>
  '';

  home.file.".asdfrc".text = ''
    legacy_version_file = yes
    # https://github.com/halcyon/asdf-java#macos-integration
    java_macos_integration_enable = yes
  '';

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    dotDir = ".config/zsh";
    dirHashes = {
      dotfiles = "${homeDir}/.dotfiles";
    };
    enableSyntaxHighlighting = true;
    initExtra = ''
      fh() {
        print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
      }
    '';
    profileExtra = ''
      if [ -e ${homeDir}/.nix-profile/etc/profile.d/nix.sh ]; then . ${homeDir}/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

      if [ -e ${homeDir}/.nix-profile/etc/profile.d/asdf-prepare.sh ]; then . ${homeDir}/.nix-profile/etc/profile.d/asdf-prepare.sh; fi # init asdf

      # https://github.com/Homebrew/discussions/discussions/446#discussioncomment-263078
      if [ -e /opt/homebrew/bin/brew ]; then eval $(/opt/homebrew/bin/brew shellenv) ; fi
    '';
    sessionVariables = {
      EDITOR = "vim";
      NNN_USE_EDITOR = "1";
    };

    oh-my-zsh = {
      enable = true;
      theme = "kolo";
      plugins = ["docker" "docker-compose" "git" "tig"];
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

  programs.neovim = {
    enable = true;
    extraConfig = builtins.readFile ./extraConfig.vim;
    # nix-env -f '<nixpkgs>' -qaP -A vimPlugins | fzf
    plugins = with pkgs.vimPlugins; [
      vim-sensible
      vim-vinegar
      vim-commentary
      vim-endwise
      vim-fugitive
      jdaddy-vim
      vim-rails
      vim-surround
      vim-polyglot
      fzf-vim
      palenight-vim
      ale
      vim-gitgutter
      indentLine
      rainbow
      vim-test
      vimux
    ];
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    sensibleOnTop = true;
    prefix = "C-a";
    terminal = "screen-256color";
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      pain-control
      logging
      {
        plugin = dracula;
        extraConfig = ''
          # https://draculatheme.com/tmux
          set -g @dracula-plugins "battery"
          set -g @dracula-show-left-icon session
        '';
      }
    ];
    extraConfig = ''
      set -ga terminal-overrides ",xterm-256color:Tc"
      bind T popup -E -h 95% -w 95% -x 100% "htop"
      bind S popup -d '#{pane_current_path}' -w 95% -h 95% -E 'tig status'
      # enable mouse support for switching panes/windows
      set -g mouse on
    '';
  };


  home.file.".local-gitconfig".source = ./gitconfig.local;

  programs.git = {
    enable = true;
    aliases = {
      hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
    };
    extraConfig = {
      user = {
        name = "Ricardo Cruz";
      };
      core = {
        editor = "vim";
      };
      color = {
        ui = "auto";
        diff = "auto";
      };
      "color \"branch\"" = {
        current = "yellow reverse";
        local = "yellow";
        remote = "green";
      };
      "color \"diff\"" =  {
        meta = "yellow bold";
        frag = "magenta bold";
        old = "red bold";
        new = "green bold";
      };
      "color \"status\"" = {
        added = "yellow";
        changed = "green";
        untracked = "cyan";
      };
      push.default = "current";
      web.browser = "open";
      commit.verbose = "true";
    };

    ignores = [
      "tags"
      "projections.json"
      ".exrc"
      ".vimrc"
      ".DS_STORE"
      ".vscode"
      ".idea"
      ".tool-versions"
      ".env.*"
    ];

    includes = [ { path = "${homeDir}/.local-gitconfig"; } ];
  };
}
