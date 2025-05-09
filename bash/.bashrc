#
# ~/.bashrc

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/giftedodd/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/giftedodd/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /home/giftedodd/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/giftedodd/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /home/giftedodd/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/giftedodd/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/giftedodd/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/giftedodd/.config/synth-shell/better-history.sh
fi

function yazi() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	/usr/bin/yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias dog=echo
alias Bash="cd ~/Projects/Bash"
alias Rust="cd ~/Projects/Rust"
alias Python="cd ~/Projects/Python"
alias Java="cd ~/Projects/Java"
alias Dart="cd ~/Projects/Dart"
alias venv="source ~/Projects/Python/TermoTrain/.venv/bin/activate"
alias train=~/Projects/Python/TermoTrain/run.sh
