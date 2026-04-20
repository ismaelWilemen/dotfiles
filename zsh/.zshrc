if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme

setopt interactivecomments
export EDITOR=nvim

# ── fd como backend do fzf ─────────────────────────────────────────────────────────────────────────────────
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range=:50 {}' --preview-window=right:50%"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -50' --preview-window=right:40%"

# ── Completion engine (antes de tudo que usa completion) ───────────────────────────────────────────────────
autoload -Uz compinit
for dump in "${ZDOTDIR:-$HOME}/.zcompdump"(N.mh+24); do
  compinit
done
compinit -C
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case insensitive

# ── fzf keybinds (Ctrl+T, Alt+C, Ctrl+R) ───────────────────────────────────────────────────────────────────
if [[ ! -f ~/.fzf.zsh_static ]]; then
  fzf --zsh > ~/.fzf.zsh_static
fi
source ~/.fzf.zsh_static

# ── fzf-tab (Tab vira popup fzf) ───────────────────────────────────────────────────────────────────────────
# Deve vir DEPOIS do compinit e do source fzf
source ~/zsh_plugins/fzf-tab/fzf-tab.plugin.zsh

zstyle ':fzf-tab:complete:*' fzf-preview \
  'bat --color=always $realpath 2>/dev/null || eza --tree --color=always $realpath 2>/dev/null'
zstyle ':fzf-tab:complete:cd:*'  fzf-preview 'eza --tree --color=always $realpath'
zstyle ':fzf-tab:complete:z:*'   fzf-preview 'eza --tree --color=always $realpath'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-header'

# ── History ────────────────────────────────────────────────────────────────────────────────────────────────
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space

bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# ── Aliases ────────────────────────────────────────────────────────────────────────────────────────────────
alias hotspot="sudo nmcli device wifi hotspot ssid 'rhakkis' password 'ic020322' ifname wlan0"
alias find='fd'
alias grep='rg'
alias cat='bat'
alias ls='eza --icons'
alias ll='eza -lah --icons --git'
alias lt='eza --tree --icons --level=2'

# ── Editor inline ──────────────────────────────────────────────────────────────────────────────────────────
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
bindkey ' ' magic-space

# ── chpwd ──────────────────────────────────────────────────────────────────────────────────────────────────
chpwd() {
  eza --icons
}

# ── zoxide ─────────────────────────────────────────────────────────────────────────────────────────────────
if [[ ! -f ~/.zoxide.zsh_static ]]; then
  zoxide init zsh --cmd cd > ~/.zoxide.zsh_static
fi
source ~/.zoxide.zsh_static

# ── Autosuggestions (inline, aceita com → ou Ctrl+F) ───────────────────────────────────────────────────────
source ~/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # histórico primeiro, depois completion
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# ── Syntax highlighting (sempre por último) ────────────────────────────────────────────────────────────────
source ~/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export GOOGLE_API_KEY="AIzaSyB_t5iXOiSLXFvUxQjSs7knkaRE4r-KVYA"
export ANTHROPIC_BASE_URL="http://127.0.0.1:3456"
export ANTHROPIC_API_KEY="dummy"
export ANTHROPIC_AUTH_TOKEN="local-router"
