#!/bin/bash

# Check if gum is installed
if ! command -v gum &>/dev/null; then
  echo "gum could not be found, please install it to continue."
  exit
fi

# Use gum to choose the preview mode
preview_mode=$(gum choose "stats" "logs")

# Set the fzf preview command based on the selected mode
if [[ "$preview_mode" == "stats" ]]; then
  preview_command="docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}' \$(echo {} | awk '{print \$1}')"
elif [[ "$preview_mode" == "logs" ]]; then
  preview_command="docker logs --tail 50 \$(echo {} | awk '{print \$1}')"
fi

# Get the container ID using fzf with the dynamic preview, now without the docker ps header
container_id=$(docker ps --format "{{.ID}}\t{{.Image}}\t{{.Names}}" | fzf --preview "$preview_command" | awk '{print $1}')

# If a container ID was selected, exec into it
if [[ -n "$container_id" ]]; then
  docker exec -it "$container_id" bash
fi
