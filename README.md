# Secure Bash Prompt

I like the functionality of custom shell prompts like
[Starship](https://starship.rs/) but also think they're a security
liability to have installed on the workstation of someone that may have
access to sensitive environments, like myself. I don't have the time or
motivation to audit 1000s of lines of code.

This project is an attempt to write some of the functionality of the fancy
prompts in a secure and minimal way, a couple of hundred lines of pure
Bash at the maximum. It should be easy to audit.

## Usage

TODO: update with advice on locals and unset -f

* Copy the contents of `prompt_command.sh` to your `$HOME/.bashrc` file.
* Customise the `PS1` variable as you'd like the prompt to look. 
* Extra functionality is available in `functions.sh`. To use this file,
  put it somewhere safe from other non-root users in your home directory,
  remove POSIX permissions other than your user, then `source` the
  absolute path to the file.
* Using `functions.sh` is optional and you can use as much or as little
  as you like. You may wish to start with a blank file and slowly add
  things.
* It's designed to play nicely with old school `PS1` generation tools like
  https://bash-prompt-generator.org/.
* `source $HOME/.bashrc`.

## More info

It's for GNU/Linux and GNUified MacOS. I don't envisage this being POSIX
compliant or supporting anything other than GNU userland/Bash. You're
welcome to fork though.

It's intended to be highly modular such that people can pick/choose the
functionality they want and don't have to audit code for functionality
that is not required.

I value responsiveness of the prompt so features that take too much time
to execute will not be accepted. Given a press of return, a new prompt
should appear almost immediately.

I
[originally started writing it last year](https://github.com/JamesLochhead/workstation_setup/tree/main/wip/yabp)
but got distracted/lost motivation because it was good enough for me then.
The original code isn't very readable and has the odd bug. I'm writing a
neater version here.

I am not going to try and replicate the entire functionality of the less
than ideal code all at once but rather do it in small chunks, when I can.

I'm making it open source in the hope other people may contribute new
functionality and help fix bugs.
