# alias for fabric
# Add this to your .bashrc or .zshrc
function fabric_alias() {
  # Store stdin in a variable if it exists
  if [ ! -t 0 ]; then
    content=$(cat)
  else
    echo "Error: No input provided via pipe" >&2
    return 1
  fi

  # Get pattern selection via fzf
  local pattern=$(fabric -l | fzf --height 40% --reverse)
  if [ -n "$pattern" ]; then
    printf '%s' "$content" | fabric -sp "$pattern"
  fi
}
alias fab='fabric_alias'
