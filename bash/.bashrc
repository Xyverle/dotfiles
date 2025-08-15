# Add ~/.cargo/bin/ and ~/.local/bin to PATH
export PATH="~/.local/bin:$PATH"
export PATH="~/.cargo/bin:$PATH"

[[ $- != *i* ]] && return # Don't continue if not interactive

export HISTCONTROL=ignorespace
export BROWSER=librewolf
export MANPAGER='nvim +Man!'
export PAGER="nvim -R"
# pfetch settings
# note: here I am actually using pfetch-rs and not pfetch for a faster runtime https://github.com/Gobidev/pfetch-rs
# if you want to use something other than pfetch remove first 2 lines and replace FETCH with your preferred fetch
export PF_INFO="title ascii os host kernel uptime pkgs memory"
export PF_COL3=1
export FETCH='pfetch'
alias clear="clear; $FETCH"
$FETCH 

alias nv="nvim"
alias l="eza -a -l -s type --icons --no-permissions"
alias hf="hyperfine"
eval "$(zoxide init bash --cmd j)"

export _ZO_DOCTOR=0

# jump and list
jl(){
    j $1; l
}

# this colors the dollar sign green on command success/ctrl+c termination/ctrl+z suspension and red on failure(it also gives the exit code on failure)
prompt_command(){
    success_color="\[\e[32m\]"
    failure_color="\[\e[31m\]"
    dir_color="\[\e[34m\]"
    color_reset="\[\e[0m\]"
    cmdstatus="$?"
    if [ "$cmdstatus" -eq 0 ] || [ "$cmdstatus" -eq 130 ] || [ "$cmdstatus" -eq 148 ]; then
        color="$success_color"
    else
        color="$failure_color$cmdstatus"
    fi
    PS1="$dir_color\w $color\$ $color_reset"
}
export PROMPT_COMMAND="prompt_command"

# Some Bash completion stuff, tbh I forgot how this works but it seems to work fine

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
