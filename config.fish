# Common aliases
alias ll   "ls -al"
alias tls  "tmux list-sessions"
alias tmux "env TERM=xterm-256color tmux"
alias vim  "new_or_fg nvim"
alias vi   "vim"
alias lfc  "source ~/.config/fish/config.fish"
alias ltc  "tmux source-file ~/.tmux.conf"
alias my   "pushd ~/mydotfiles"
alias b    "popd"
alias efc  "vi ~/.config/fish/config.fish && lfc"
alias evrc "vi ~/.config/nvim/init.vim"
alias elc  "vi -p ~/.config.fish.local ~/.tmux.conf.local && lfc && ltc"

## Git
alias g     "git"
#	alias ga     "git a -p"
#	alias gco    "git co"
#	alias gs     "git s"
#	alias gls    "git ls"
#	alias gg     "git g"
#	alias gl     "git last"
#	alias gc     "git c"
#	alias gu     "git up"
#	alias gb     "git b"
#	alias gp     "git put"
#	alias gd     "git d"
#	alias gm     "git merge"
#	alias gup    "git up"
#	alias gbd    "git b -D"
#	alias gclean "git co -- .; git clean -fd"
#	alias gds    "git ds"

# Bundler
alias bi "bundle install"
alias be "bundle exec"
alias bo "bundle open"

function fzf
  env FZF_DEFAULT_OPTS="--reverse --height 60% $FZF_DEFAULT_OPTS" fzf
end

function ta
  tmux attach-session -t $argv;
end

function fco -d "Fuzzy-find branch and checkout it"
  git branch --all | grep -v HEAD | string trim | fzf | xargs git co
end

function tags -d "Print last n tags, example: tags 3"
  set -l n $argv[1]
  set -q n[1]; or set -l n 1
  git tag --sort=-v:refname | head -n $n
end

function new_or_fg
  set -l job (jobs | grep -e "$argv\$")
  if test -n "$job"
    set -l group (echo $job | awk '{print $2}')
    fg $group
  else
    eval $argv
  end
end

function colors
  set -l color (functions | grep base16- | fzf)
  if string length -q -- $color
    $color
  end
end

bind \cb fco

set -U FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!node_modules/*"'

set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

set -gx fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

set -gx GOPATH ~/go
set -gx GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN ~/bin

mkdir -p ~/bin
mkdir -p $GOBIN

# Remove greeting
set fish_greeting

# NOT USED
# Configure direnv 
# eval (direnv hook fish)

# NOT USED
# Setup asdf
#set -gx DIRENV_LOG_FORMAT ""
#source ~/.asdf/asdf.fish

# Setup base16 colorscheme (shell, fzf)
set BASE16_DIR ~/.config/base16
set -gx BASE16_SHELL_HOOKS $BASE16_DIR/hooks
set -gx FZF_DEFAULT_OPTS_FILE $BASE16_DIR/fzf_default_opts
source $BASE16_DIR/shell/profile_helper.fish
if test -e ~/.base16_fzf
  source ~/.base16_fzf
end

# Local settings
source ~/.config.fish.local
