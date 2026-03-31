#hist
HISTFILE="$XDG_CACHE_HOME/zsh/history"
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
setopt PROMPT_SUBST
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
alias ..="cd .."
alias grep="grep --color=auto"
alias lsblk="lsblk | bat -ppl conf"
alias mkdir="mkdir -p"
#alias cp="cp -i"
#alias mv="mv -i"
#alias rm="rm -i"
alias wget="wget --hsts-file=$XDG_STATE_HOME/wget-hsts"
alias zz="nvim $HOME/.zshrc"
alias ze="nvim $HOME/.zshenv"
alias rz="source $HOME/.zshrc"
alias xb="doas xbps-install"
alias xr="doas xbps-remove"
alias xq="xbps-query"
alias xs="xbps-slay"
alias x="launch dwm"
alias xini="nvim $HOME/.xinitrc"
alias xres="nvim $HOME/.Xresources"
alias todo="nvim $HOME/Documents/obsidian_vault/terminaltown/denizen_todo.md"
alias notes="nvim $HOME/Documents/obsidian_vault/terminaltown/denizen_notes.md"
alias o="cd $HOME/Documents/Vault && y"
alias op="cd $HOME/Documents/Vault/planner && y"
alias suck="cd $HOME/.local/src/suckless && y"
alias pc="cd $HOME/.cache/wal && y"
alias scripts="cd $HOME/scripts && y"
alias scrots="cd $HOME/Pictures/screenshots && y"
alias rs="cd $HOME/.local/projects/rust && y"
alias code="cd $HOME/code && y"
alias src="cd $HOME/.local/src && y"
alias cr="cargo run"
alias crmusl="RUSTFLAGS=\"-C target-feature=-crt-static\" cargo run --target x86_64-unknown-linux-musl"
alias fastfetch="fastfetch --file $HOME/Templates/asciidoodles/void2_small.txt --logo-padding-left 3 --logo-padding-right 5"
alias ff="fastfetch"
alias pv="ping voidlinux.org"
alias colors="cat $HOME/.cache/wal/colors | pastel format"
alias stars="astroterm -Cc -s 400 -a 41.1081 -o -81.5148"
alias sturs="astroterm -Cuc -s 400 -a 41.1081 -o -81.5148"
alias nmtui="doas nmtui"
alias dy="doas yazi"
alias beget="doas make install && make clean"
alias svfailed="doas sv status /var/service/* | grep -v run"
alias piximg="nsxiv --anti-alias=no"
alias babycheck="nsxiv --anti-alias=no $HOME/.cache/wal/xbaby/sleeping"
alias copy="xclip -selection clipboard"

#etc
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init --cmd cd zsh)"

function c() {
    ${EDITOR:-nvim} "$HOME/.config/${(j:/:)@}"
}

function s() {
    ${EDITOR:-nvim} "$HOME/scripts/${(j:/:)@}"
}

function v() {
    ${EDITOR:-nvim} "$HOME/Documents/Vault/${(j:/:)@}.md"
}

function hc() {
    hx "$HOME/.config/${(j:/:)@}"
}

function hs() {
    hx "$HOME/scripts/${(j:/:)@}"
}

function hv() {
    hx "$HOME/Documents/Vault/${(j:/:)@}.md"
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
    #mdcat -p $XDG_DATA_HOME/man/man1/$@.md
    mdcat -p $HOME/.local/share/man/man1/$@.md
}

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

case "$TERM" in
    linux|xterm)
        nl=$'\n'
        PROMPT="${nl}%K{1}%F{0} %D{%I:%M} %K{3} zsh %K{4} %n %K{5} %m %f%k${nl}%F{7}┌── %~${nl}└─%f "
        ;;
    *)
        source "$HOME/scripts/prompta"
        ;;
esac
