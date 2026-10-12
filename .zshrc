# =============================================================================
# ~/.zshrc - CachyOS KDE Desktop Zsh Configuration
# =============================================================================

# Exit early if not interactive
[[ -o interactive ]] || return

# -----------------------------------------------------------------------------
# [1] ENVIRONMENT VARIABLES & PATH
# -----------------------------------------------------------------------------
export TERMINAL='ghostty'
export EDITOR='micro'
export VISUAL='micro'

# Hyödynnetään Ryzen 7 7800X3D:n kaikkia 16 säiettä kääntämisessä
export MAKEFLAGS="-j$(nproc)"

# Polut
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# [2] HISTORY CONFIGURATION
# -----------------------------------------------------------------------------
HISTSIZE=50000
SAVEHIST=25000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# -----------------------------------------------------------------------------
# [3] COMPLETION SYSTEM (Fast 24h Cache)
# -----------------------------------------------------------------------------
setopt EXTENDED_GLOB

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh-24) ]]; then
  compinit -C
else
  compinit
  touch "${ZDOTDIR:-$HOME}/.zcompdump"
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# -----------------------------------------------------------------------------
# [4] KEYBINDINGS (Vi-Mode & History Search)
# -----------------------------------------------------------------------------
bindkey -v
export KEYTIMEOUT=40

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "${terminfo[kcuu1]:-^[[A}" history-beginning-search-backward-end
bindkey "${terminfo[kcud1]:-^[[B}" history-beginning-search-forward-end

setopt INTERACTIVE_COMMENTS
setopt GLOB_DOTS
setopt NO_CASE_GLOB
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# -----------------------------------------------------------------------------
# [5] ALIASES & MODERN CLI TOOLS
# -----------------------------------------------------------------------------
# Modernit korvaajat
if command -v eza &>/dev/null; then
    alias ls='eza --icons'
    alias ll='eza -la --icons'
    alias la='eza -a --icons'
    alias tree='eza --tree --icons'
fi

if command -v bat &>/dev/null; then
    alias cat='bat --paging=never'
fi

alias top='bottom'
alias btm='bottom'

# Turvallisuusaliakset
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I'
alias ln='ln -v'

# Pikakomennot
alias df='df -hT'

# -----------------------------------------------------------------------------
# [6] PLUGINS & PROMPT INITIALIZATION
# -----------------------------------------------------------------------------

# Zoxide (Älykäs cd-korvaaja)
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# Starship Prompt (Nopea välimuisti-alustus)
_starship_cache="$HOME/.starship-init.zsh"
_starship_bin="$(command -v starship)"
if [[ -n "$_starship_bin" ]]; then
  if [[ ! -f "$_starship_cache" || "$_starship_bin" -nt "$_starship_cache" ]]; then
    starship init zsh --print-full-init >! "$_starship_cache"
  fi
  source "$_starship_cache"
fi

# Fuzzy Finder (fzf)
_fzf_cache="$HOME/.fzf-init.zsh"
_fzf_bin="$(command -v fzf)"
if [[ -n "$_fzf_bin" ]]; then
  if $_fzf_bin --zsh > /dev/null 2>&1; then
      if [[ ! -f "$_fzf_cache" || "$_fzf_bin" -nt "$_fzf_cache" ]]; then
        $_fzf_bin --zsh >! "$_fzf_cache"
      fi
      source "$_fzf_cache"
  fi
fi

# Zsh-laajennukset (Arch/CachyOS vakiopolut)
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

unset _starship_cache _starship_bin _fzf_cache _fzf_bin
