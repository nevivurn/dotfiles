# Wrap around SSH to override TERM
# TODO: refer to ssh/config.
function ssh {
	if [[ "$TERM" = "foot" ]]; then
		TERM=xterm-256color command ssh "$@"
	else
		command ssh "$@"
	fi
}
