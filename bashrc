#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.local/share/icons-in-terminal/icons_bash.sh

alias ls='ls -lh --color=auto'
alias emacs='emacs -nw'             # Disable emacs window
alias rm='rm -i'                    # Promt before removing files
alias mv='mv -i'                    # Prompt if a move causes an override
alias cp='cp -i'                    # Prompt if a copy causes an override
alias sudo='sudo '
alias sail='./vendor/bin/sail'
alias chat='wa chat.openai.com'


alias appScript='wa https://www.google.com/script/start/'

EDITOR=/usr/bin/emacs

hide_floating_shell() {
	WINDOW_TITLE=$(xdotool getwindowfocus getwindowname)
	WINDOW=$(xdotool search --name "FloatingShell")
	xdotool windowunmap "$WINDOW"
	xdotool set_window --name "FloatingShellHidden" "$WINDOW"
	pkill overlay
}

if xhost >&/dev/null; then
	WINDOW_TITLE=$(xdotool getwindowfocus getwindowname)		
fi

launch() {
	if [ -z $1 ]; then
		return
	fi

	( eval \\$@ > /dev/null 2>&1 )& 
	disown

	if [[ $WINDOW_TITLE = "FloatingShell"* ]]; then
		hide_floating_shell
	fi
}

webdev() {
	 if [ -n $1 ]; then
	    code $1
	 fi

	 wa laravel
	 wa tailwindcss
	 launch wa 10.0.0.70
}

launch_apps=$(cat ~/.launch_apps 2>/dev/null)

if [[ $WINDOW_TITLE = "FloatingShell"* ]]; then
	echo
	echo "Floating Shell..."
	echo
	for app in $(echo $launch_apps); do
		alias $app="launch $app"
	done	
fi

#COLOR definitions

GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 20)\]"
PURPLE="\[$(tput setaf 165)\]"
MAG="\[$(tput setaf 207)\]"
RESET="\[$(tput sgr0)\]"

#
# Custom prompt
#
# Using Font Awesome to display icons
number_of_jobs() {
	jobs_total=$(jobs | wc -l)
	if [ $jobs_total -gt 0 ]; then
		echo -ne "$fa_dot_circle_o" #Loading dots for background jobs
	else
		echo -ne "$fa_circle_o" #Regular circle for no background jobs
	fi

}

error_handle() {

	case $1 in
	0)
		echo -ne "${GREEN}$(number_of_jobs)${RESET}"
		;;
	126 | 127)
		echo -ne "${RED}$(number_of_jobs)${RESET}"
		;;
	128)
		echo -ne "${BLUE}$(number_of_jobs)${RESET}"
		;;
	130)
		echo -ne "${PURPLE}$(number_of_jobs)${RESET}"
		;;
	148)
		echo -ne "${MAG}$(number_of_jobs)${RESET}"
		;;
	*)
		echo -ne "$(number_of_jobs)"
		;;
	esac

}

set_colors() {
	(cat ~/.cache/wal/colors.sh &)
}

set_bash_prompt() {
	commOutput=$(echo $?)
	ARROW=$(echo -ne "$fa_angle_double_right")
	FOLDER=$(echo -ne "$fa_folder_o")
	PS1="$FOLDER \W \n$(error_handle $commOutput) $ARROW "
}

set_prompt() {
	PS1="${GREEN}\W${RESET} \n ${PURPLE}>${RESET} "
}

PARENT=$(ps -p $$ -o ppid=)
TERMINAL=$(ps -p $PARENT -o args=)

if [[ $TERMINAL == *"/electron"* ]]; then
	PROMPT_COMMAND=set_prompt
	set_prompt
else
	PROMPT_COMMAND=set_bash_prompt
	set_bash_prompt
fi

for completion_file in $(\ls /home/jp/.local/bin/*-completion); do
	source $completion_file
done
