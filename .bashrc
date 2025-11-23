alias ls='ls --color=auto'
alias sshlist='grep -w "Host" ~/.ssh/config '
alias ip='curl ifconfig.me' # publicIP
alias ipmac='ipconfig getifaddr en0' # macos privateIP 
alias iplinux="hostname -I | awk '{print \$1}'" # linux privateIP

alias pyserver='echo "Starting server at http://$(ipconfig getifaddr en0):8000" &&
    python3 -m http.server 8000'

# copy content to clipboard
# cat file.txt | pbcopy 
# pbpaste

# 'osascript' to programmatically manage macos custom notifications
# 'say "welcome"' to voice output the string in macos

# BASH or ZSH specific
if [ -n "$ZSH_VERSION" ]; then
    setopt noclobber  # prevent file overwrite via > operator

    # Prompt configuration with git branch and venv
    autoload -Uz vcs_info
    precmd() { vcs_info }

    zstyle ':vcs_info:git:*' formats ' (%b)'
    zstyle ':vcs_info:*' enable git

    setopt PROMPT_SUBST
    PROMPT='%{%F{243}%}%1~${vcs_info_msg_0_}%{%f%} %# '

elif [ -n "$BASH_VERSION" ]; then
    set -o noclobber  # prevent file overwrite via > operator
fi


# misc ------------
alias openvs="code -r "
alias opencursor="cursor -r "
alias path="echo $PATH | tr ':' '\n'"
alias mdnewline="sed -i '' 's/$/  /'"

export PATH="/Users/sathvikpn/.antigravity/antigravity/bin:$PATH"
