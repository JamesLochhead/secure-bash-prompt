set_text_foreground_color() {
	# Print text in a different colour and optionally make it bold.
	# $1: the text. $2, $3, and $4 are three integers to represent the color.
	# Use https://bash-prompt-generator.org/ to work out what integer you
	# need. If $5 is present and true, the text is bold. Call this in a
	# a subshell and store the result in a variable.
	local _BOLD
	_BOLD=$(tput bold)
	if [[ "$5" == true ]]; then
		printf "\[\e[0;1;%s;%s;%sm\]\[$_BOLD\]%s\[\e[0m\]" "$2" "$3" "$4" "$1"
	else
		printf "\[\e[0;1;%s;%s;%sm\]%s\[\e[0m\]" "$2" "$3" "$4" "$1"
	fi
}

export set_text_foreground_color

current_working_directory() {
	# If the absolute path to the current working directory contains
	# the path to $HOME, replace it with ~. If it's exactly the $HOME
	# directory, replace that with the absolute path to $HOME. Print
	# the result.
	local result
	result="$(pwd | sed "s|$HOME|~|")"
	if [[ "$result" == "~" ]]; then
		result="$HOME"
	fi
	printf "%s" "$result"
}

export current_working_directory

print_env_var() {
	# Print the current AWS region if it's set
	if [[ -v $1 ]]; then
		printf "%s" "$""$1"
	fi
}

export print_env_var

space_if_not_empty() {
	# Add a space in front of $1 if it's not empty, then print it
	if [[ -n "$1" ]]; then
		printf " %s" "$1"
	fi
}

export space_if_not_empty

rc() {
	# If $1 isn't 0, print it. Intended for the last return code.
	if (( "$1" != 0 )); then
		printf "%s" "$1"
	fi
}

export rc
