alias 'please?'='sudo $(history 2 | cut -c 8- | head -n 1)'
alias wtf='tldr'
alias cowsay='cowsay -f kitten'
alias meow='clear && cowsay -f kitten "MEOW HOOMAN"'
alias toxictux_error='/home/josh/rude.sh /home/josh/rude-comments.txt | cowsay -f tux'
alias toxictux_syntax='/home/josh/rude.sh /home/josh/rude-comments.txt | cowsay -f tux'
alias ls='eza --icons -a'
alias l='eza --icons -a -TL 2'

# Alias to use run_command for all commands
alias run='run_command'
alias pdf='pandoc --defaults=/home/josh/.pandoc/default-style.yaml'
alias pserve='python3 -m http.server'
alias serve='node /home/josh/code/simpleFileServer/server.js'
alias ai='clear && gum style --foreground "$Flamingo" --border-foreground "$Mauve" --border double --align center --width 30 --margin "1 2" --padding "2 4" "Consult your AI overloads...."  && gum spin --spinner points --padding "1 5" --align right --title="Thinking..." -- ai "$(gum input --cursor.foreground "$Mauve" --placeholder "prompt...")" | gum pager --border-foreground "$Mauve" --show-line-numbers=false'

alias yeetjs='node /home/josh/code/github/code-context-yeeter/yeetCode.js'
alias yeet='/home/josh/code/github/code-context-yeeter/yeetCode.sh'
alias ask='/home/josh/code/ollama/ask'
alias cat="batcat"
alias f="fzf --preview 'batcat {}' --bind 'enter:execute(nvim {})'"
alias ff="find / \( -type f -o -name '.*' \) 2>/dev/null | fzf --preview 'batcat {}' --bind 'enter:execute(nvim {})'"
alias vim="nvim"

echo "all aliases loaded...."
