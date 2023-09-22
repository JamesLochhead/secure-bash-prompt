prompt_command() {
	LAST_RC="$?"
	source "$HOME/Personal.Git/secure-bash-prompt/functions.sh"

	local GREATER_THAN; local HOST_NAME; local WORKING_DIR;
	local FIRST_LINE; local SECOND_LINE; local SBP_AWS_REGION

	space_and_colour() {
		printf "%s" "$(space_if_not_empty "$(set_text_foreground_color "$1" "$2" "$3" "$4" "$5")")"
	}

	GREATER_THAN="$(set_text_foreground_color ">" "38" "5" "33" true)"
	HOST_NAME="$(set_text_foreground_color "\h" "38" "5" "33" true)"
	NOCOLOR_CWD="$(current_working_directory)"
	WORKING_DIR=$(set_text_foreground_color "$NOCOLOR_CWD" "38" "5" "33" true)
	SBP_AWS_REGION="$(space_and_colour "$(aws_region)" "0" "0" "0" true)"
	RC="$(space_and_colour "$(rc $LAST_RC)" "0" "0" "0" true)"

	FIRST_LINE="$HOST_NAME $WORKING_DIR$SBP_AWS_REGION$RC"
	SECOND_LINE="$GREATER_THAN "

	PS1="\n$FIRST_LINE\n$SECOND_LINE"
	export PS1

	unset -f set_text_foreground_color
	unset -f current_working_directory
	unset -f aws_region
	unset -f space_if_not_empty
	unset -f rc
}

PROMPT_COMMAND=prompt_command
