#env
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$HOME/.local/bin:$PATH"
export MANPAGER="less -R --use-color -Dd+M -Du+B -DP+G -Ds+C"
#export MANPAGER="nvim +Man!"

#hist
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt NO_HIST_REDUCE_BLANKS

#zshbasic
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt EXTENDEDGLOB
autoload -Uz compinit && compinit
autoload -Uz tetriscurses
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle :compinstall filename '/home/ch_rism_/.zshrc'
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -v
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^l' autosuggest-accept

#alias
alias ls="eza --icons --group-directories-first --color=auto --oneline --all"
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias wget="wget --hsts-file=$XDG_STATE_HOME/wget-hsts"
alias fastfetch="fastfetch --file ~/Templates/asciidoodles/void2_small.txt --logo-padding-left 3 --logo-padding-right 5"
alias zz='nvim ~/.zshrc'
alias rz='source ~/.zshrc'
alias o="cd ~/Documents/obsidian_vault && y"
alias op="cd ~/Documents/obsidian_vault/__planner && y"
alias synco="obsidian_sync"
alias archup="arch_update_yay"
alias suck="cd ~/.local/src/suckless && y"
alias wp='paper && source ~/.zshrc'
alias stars="astroterm -Cc -s 400 -a 41.1081 -o -81.5148"
alias stors="astroterm -Cuc -s 400 -a 41.1081 -o -81.5148"
alias x="startx"
alias news="hackernews_tui"
alias todo="nvim ~/Documents/obsidian_vault/terminaltown/denizen_todo.md"
alias notes="nvim ~/Documents/obsidian_vault/terminaltown/denizen_notes.md"
alias pc="cd ~/.cache/wal && y"
alias scripts="cd ~/scripts && y"
alias wtf="wtfutil"
alias colors="cat ~/.cache/wal/colors | pastel format"
alias xb="doas xbps-install"
alias xr="doas xbps-remove"
alias xq="xbps-query"
alias xs="xbps-slay"
alias xini="nvim $HOME/.xinitrc"
alias svfailed="doas sv status /var/service/* | grep -v run"
alias brighter="xrandr --output eDP-1 --brightness 1.6"
alias brightoff="xrandr --output eDP-1 --brightness 1.0"
alias src="cd ~/.local/share/void-packages"
alias cr="cargo run"
alias rs="cd ~/.local/projects/rust && y"

#etc
source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init --cmd cd zsh)"

function c() {
    ${EDITOR:-nvim} "$HOME/.config/${(j:/:)@}"
}

function s() {
    ${EDITOR:-nvim} "$HOME/scripts/${(j:/:)@}"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function woman() {
    bat $XDG_DATA_HOME/man/man1/$@.md
}

#reload-zshrc() {
#    source ~/.zshrc
#}
#zle -N reload-zshrc
#bindkey '^B' reload-zshrc

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
ZSH_HIGHLIGHT_STYLES[default]="fg=white"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=white"
ZSH_HIGHLIGHT_STYLES[command]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[function]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[path]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[cursor]="fg=blue"
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=green"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=blue"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=magenta"

#old prompt sourcing pywal cols before i realized zsh can just take ansi term colors
#source ~/.cache/wal/colors.sh
#NEWLINE=$'\n'
#PROMPT="${NEWLINE}%K{${color1}}%F{${foreground}} %D{%_I:%M%P} %K{${color3}} %n %K{${color5}} %~ %f%k ❯ "
# %3~ expands to tailing 3 dirs in cwd

NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{1}%F{15} %D{%_I:%M%P} %K{3} %n %K{5} %~ %f%k ❯ "
