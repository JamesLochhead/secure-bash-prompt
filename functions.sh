set_text_foreground_color() {
	# Print text in a different colour and optionally make it bold.
	# $1: the text. $2, $3, and $4 are three integers to represent the color.
	# Use https://bash-prompt-generator.org/ to work out what integer you
	# need. If $5 is present and true, the text is bold. Call this in a
	# a subshell and store the result in a variable.
	if [[ $5 == true ]]; then
		printf "\[\e[0;1;%s;%s;%sm\]\[$_BOLD\]%s\[\e[0m\]" "$2" "$3" "$4" "$1"
	else
		printf "\[\e[0;1;%s;%s;%sm\]%s\[\e[0m\]" "$2" "$3" "$4" "$1"
	fi
}

export set_text_foreground_color
