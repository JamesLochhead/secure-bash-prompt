source "$HOME/Personal.Git/secure-bash-prompt/functions.sh"

prompt_command() {
	GREATER_THAN="$(set_text_foreground_color ">" "38" "5" "33" true)"
	HOST_NAME="$(set_text_foreground_color "\h" "38" "5" "33" true)"
	WORKING_DIR=$(set_text_foreground_color "\w" "38" "5" "33" true)

	FIRST_LINE="$HOST_NAME $WORKING_DIR"
	SECOND_LINE="$GREATER_THAN "

	PS1="\n$FIRST_LINE\n$SECOND_LINE"
	export PS1
}

PROMPT_COMMAND=prompt_command
