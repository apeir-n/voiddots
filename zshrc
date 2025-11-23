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
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias wget="wget --hsts-file=$XDG_STATE_HOME/wget-hsts"
alias zz='nvim ~/.zshrc'
alias rz='source ~/.zshrc'
alias xb="doas xbps-install"
alias xr="doas xbps-remove"
alias xq="xbps-query"
alias xs="xbps-slay"
alias xini="nvim $HOME/.xinitrc"
#alias x="launch dwm"
alias x="launch dwm"
alias svfailed="doas sv status /var/service/* | grep -v run"
alias todo="nvim ~/Documents/obsidian_vault/terminaltown/denizen_todo.md"
alias notes="nvim ~/Documents/obsidian_vault/terminaltown/denizen_notes.md"
alias o="cd ~/Documents/obsidian_vault && y"
alias op="cd ~/Documents/obsidian_vault/__planner && y"
alias suck="cd ~/.local/src/suckless && y"
alias pc="cd ~/.cache/wal && y"
alias scripts="cd ~/scripts && y"
alias scrots="cd ~/Pictures/screenshots && y"
alias rs="cd ~/.local/projects/rust && y"
alias cr="cargo run"
alias crmusl="RUSTFLAGS=\"-C target-feature=-crt-static\" cargo run --target x86_64-unknown-linux-musl"
alias pv="ping voidlinux.org"
alias fastfetch="fastfetch --file ~/Templates/asciidoodles/void2_small.txt --logo-padding-left 3 --logo-padding-right 5"
alias ff="fastfetch"
alias colors="cat ~/.cache/wal/colors | pastel format"
alias arc="printf '\u256d\u2500\u256e\n\u2570\u2500\u256f\n'"
alias sqr="printf '\u250c\u2500\u2510\n\u2514\u2500\u2518\n'"
alias stars="astroterm -Cc -s 400 -a 41.1081 -o -81.5148"
alias stors="astroterm -Cuc -s 400 -a 41.1081 -o -81.5148"
alias news="hackernews_tui"
alias xres="nvim ~/.Xresources"
alias nmtui="doas nmtui"
alias beget="doas make install && make clean"
alias xpetbeget="doas make clean install && doas make clean"
alias dy="doas yazi"
alias yesnigga='echo -e "\e[0;90myes nigga\n\e[0;91mno nigga\n\e[0;92myes nigga\n\e[0;93mno nigga\n\e[0;94myes nigga\n\e[0;95mno nigga\n\e[0;96myes nigga\n\e[0;97mno nigga\n\e[0m"'
alias nonigga='echo -e "\e[0;90;107myes nigga\n\e[0;91;106mno nigga\n\e[0;92;105myes nigga\n\e[0;93;104mno nigga\n\e[0;94;103myes nigga\n\e[0;95;102mno nigga\n\e[0;96;101myes nigga\n\e[0;97;100mno nigga\n\e[0m"'
alias yespleasenigga='echo -e "\e[0;30myes nigga\n\e[0;31mno nigga\n\e[0;32myes nigga\n\e[0;33mno nigga\n\e[0;34myes nigga\n\e[0;35mno nigga\n\e[0;36myes nigga\n\e[0;37mno nigga\n\e[0m"'
alias nothankyounigga='echo -e "\e[0;30;47myes nigga\n\e[0;31;46mno nigga\n\e[0;32;45myes nigga\n\e[0;33;44mno nigga\n\e[0;34;43myes nigga\n\e[0;35;42mno nigga\n\e[0;36;41myes nigga\n\e[0;37;40mno nigga\n\e[0m"'

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

function v() {
    ${EDITOR:-nvim} "$HOME/Documents/obsidian_vault/${(j:/:)@}.md"
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
