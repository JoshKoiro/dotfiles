# SSH Agent Configuration - Added by GitHub SSH Setup Script
start_ssh_agent() {
  # Kill any existing ssh-agent instances for this user
  pkill -u $USER ssh-agent 2>/dev/null || true

  # Start new ssh-agent and capture output
  echo "Starting ssh-agent..."
  eval $(ssh-agent -s)

  # Save agent info to file for reference
  echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >$HOME/.ssh-agent
  echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >>$HOME/.ssh-agent
}

# Check if ssh-agent is running and accessible
if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l >/dev/null 2>&1; then
  # Try to load existing agent info
  if [ -f "$HOME/.ssh-agent" ]; then
    source "$HOME/.ssh-agent" >/dev/null 2>&1
  fi

  # Test if the agent is actually working
  if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l >/dev/null 2>&1; then
    start_ssh_agent
  fi
fi

# Auto-add SSH key - Added by GitHub SSH Setup Script
if [ -f "/home/josh/.ssh/github" ]; then
  ssh-add -l | grep -q "/home/josh/.ssh/github" || ssh-add "/home/josh/.ssh/github" 2>/dev/null
fi

# Cleanup ssh-agent on shell exit
trap 'ssh-agent -k >/dev/null 2>&1' EXIT
