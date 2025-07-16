# Add ~/.cargo/bin/ and ~/.local/bin to PATH
export PATH="~/.local/bin:$PATH"
export PATH="~/.cargo/bin:$PATH"

[[ $- != *i* ]] && return # Don't continue if not interactive

export HISTCONTROL=ignorespace
export BROWSER=librewolf
# pfetch settings
# note: here I am actually using pfetch-rs and not pfetch for a faster runtime https://github.com/Gobidev/pfetch-rs
# if you want to use something other than pfetch remove first 2 lines and replace FETCH with your preferred fetch
export PF_INFO="title ascii os host kernel uptime pkgs memory"
export PF_COL3=1
export FETCH='pfetch'
alias clear="clear; $FETCH"
$FETCH 


# Can be replaced with whatever editor you use
alias nv="nvim"
# eza is a replacement for ls that gives it color, icons, etc... https://github.com/eza-community/eza
alias l="eza -a -l -s type --icons --no-permissions"
# hyperfine is a replacement for time that runs multiple tests and gives a summary https://github.com/sharkdp/hyperfine
alias time="hyperfine"
# zoxide is a replacement for cd that remembers path you've visited and lets you use shortcuts https://github.com/ajeetdsouza/zoxide
# optionally use can install fzf for fuzzy finding when using interactive mode https://github.com/junegunn/fzf
eval "$(zoxide init bash --cmd j)"
#                              ^ I have this bound to j change this to cd if you prefer that

# zellij is a rust replacement for tmux
#eval "$(zellij setup --generate-auto-start bash)"

# jump and list
jl(){
  j $1; l
}

# this colors the dollar sign green on command success/ctrl+c termination and red on failure(it also gives the exit code on failure)
colorPrompt(){
  cmdstatus="$?"
  if [ "$cmdstatus" -eq 0 ] || [ "$cmdstatus" -eq 130 ]; then
      printf "\033[32m$PROMPT_END"
    else
      printf "\033[31m$cmdstatus$PROMPT_END"
  fi
}

export PROMPT_END="$"
export PROMPT_DIR_COLOR="\033[34m"

# configures the prompt
# if you want to configure this simply put \[$(colorPrompt)\] before your dollar sign, arrow, etc...
export PS1='\033[34m\w \[$(colorPrompt)\]\033[0m '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
