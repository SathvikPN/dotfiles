# =====================================================================================
# Exports
# =====================================================================================

export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
# =====================================================================================




# =====================================================================================
# Common Aliases
# =====================================================================================
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sshlist='grep -E "^\s*(Host|Hostname)" ~/.ssh/config'
alias ip='curl ifconfig.me' # publicIP
alias ipmac='ipconfig getifaddr en0' # macos privateIP 
alias iplinux="hostname -I | awk '{print \$1}'" # linux privateIP
alias py=python3
# =====================================================================================




# =====================================================================================
# Common Functions
# =====================================================================================
path() { echo $PATH | tr ':' '\n'; }
pyserver() {
    local port="${1:-8000}"
    echo "Starting server at http://$(ipconfig getifaddr en0):$port"
    python3 -m http.server "$port"
}

mdnewline() { [[ -n "$1" ]] && sed -i '' 's/$/  /' "$@" || echo "Usage: mdnewline <file.md>"; }
# =====================================================================================




# =====================================================================================
# ZSH Terminals 
# =====================================================================================
if [ -n "$ZSH_VERSION" ]; then
    # prevent file overwrite via > operator
    setopt noclobber  

    # Prompt configuration with git branch and venv
    autoload -Uz vcs_info
    precmd() { vcs_info; }

    zstyle ':vcs_info:git:*' formats ' (%b)'
    zstyle ':vcs_info:*' enable git

    # Define general named colors suitable for dark mode
    local C_DIR='%F{cyan}'      # Standard cyan for directory
    local C_GIT='%F{magenta}'   # Standard magenta for git branches
    local C_RESET='%f'          # Resets color back to terminal default

    setopt PROMPT_SUBST
    PROMPT='%{${C_DIR}%}%1~%{${C_GIT}%}${vcs_info_msg_0_}%{${C_RESET}%} %# '

    # reports battery percentage including external bluetooth peripherals
    battery() { pmset -g accps; }

    # sends notification every n seconds
    loop_notif() {
        while true; do
            sleep 1200 # seconds
            osascript -e 'display notification "looped reminder" with title "Loop Notification"' &
            sleep 3
        done
        # movereminder & # run as background job
        # jobs: list background jobs
        # fg %1: bring jobID 1 to foreground
        # kill %1: kill jobID 1
    }

    # copy content to clipboard
    # cat file.txt | pbcopy 
    # pbpaste

    # 'osascript' to programmatically manage macos custom notifications
    # 'say "welcome"' to voice output the string in macos

fi 
# =====================================================================================


# =====================================================================================
# BASH Terminals
# =====================================================================================
if [ -n "$BASH_VERSION" ]; then
    # prevent file overwrite via > operator
    set -o noclobber  

    # don't put duplicate lines or lines starting with space in the history.
    HISTCONTROL=ignoreboth
    HISTSIZE=1000
    HISTFILESIZE=2000

    # append to the history file, don't overwrite it
    shopt -s histappend
    # check the window size after each command
    shopt -s checkwinsize   
    

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        ;;
    *)
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        ;;
    esac
fi
# =====================================================================================




# =====================================================================================
# UTILITY SCRIPTS

# =====================================================================================
# SCREEN session management (simplest. turn off if using tmux)
# =====================================================================================
# list all screen sockets
# rm socket as regular to delete that screen
# screen -ls 

if [ -z "$STY" ] && [ -z "$TMUX" ]; then
    # Fetch list of existing screen sessions
    sessions=($(screen -ls | awk '/\t[0-9]+\./ {print $1}'))
    num_sessions=${#sessions[@]}
    
    echo ""
    echo "--- GNU Screen Management ---"
    if [ $num_sessions -eq 0 ]; then
        echo "(No active screen sessions found)"
    else
        for i in {1..$num_sessions}; do
            echo "$i) Attach to ${sessions[$i]}"
        done
    fi
    echo "n) Create new screen session"
    
    echo -n "Select option [c/Cancel/↵]: "
    read choice
    
    if [[ -z "$choice" || "$choice" == "c" || "$choice" == "C" ]]; then
        # Default action is to cancel and do nothing
        :
    elif [[ "$choice" == "n" || "$choice" == "N" ]]; then
        screen
    elif [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "$num_sessions" ] && [ "$choice" -gt 0 ]; then
        screen -d -r "${sessions[$choice]}"
    else
        echo "Invalid selection. Staying in standard terminal."
    fi
fi
# =====================================================================================
