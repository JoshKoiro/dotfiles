# Taskwarrior functions and aliases

alias taskc='taskcommands'
alias ta='task add'
alias tm='task modify'
alias tc='task $1 annotate'
alias td='task $1 done'
# alias tq='createQuote'
alias tb='createBooking $1'

createBookingSub() {
  ta "$1" +booking +work project:"$2" | grep -oP '(?<=Created task )\d+'
}

createBooking() {
  local project_tag="quote $1"

  subtask1=$(createBookingSub 'send Email to Heidi about PO and request ship address' "$project_tag")
  subtask2=$(createBookingSub 'confirm Kevin and Heidi approve PO' "$project_tag")
  subtask3=$(createBookingSub 'create dashes' "$project_tag")
  subtask4=$(createBookingSub 'adjust costs in dashes' "$project_tag")
  subtask5=$(createBookingSub 'assign quote category' "$project_tag")
  subtask6=$(createBookingSub 'create work order' "$project_tag")
  subtask7=$(createBookingSub 'adjust ship dates and process dates' "$project_tag")
  subtask8=$(createBookingSub 'validate invoice lines and costs' "$project_tag")
  subtask9=$(createBookingSub 'book job' "$project_tag")
  subtask10=$(createBookingSub 'approve PO invoice' "$project_tag")
  subtask11=$(createBookingSub 'complete checklist' "$project_tag")
  subtask12=$(createBookingSub 'create work order notes' "$project_tag")
  subtask13=$(createBookingSub 'populate work order folders' "$project_tag")
  subtask14=$(createBookingSub 'create crating plan and release process line' "$project_tag")
  subtask15=$(createBookingSub 'schedule kickoff meeting' "$project_tag")
  subtask16=$(createBookingSub 'prepare order acknowledgement' "$project_tag")

  ta booking "$project_tag" +booking +work project:"$project_tag" due:today depends:$subtask1,$subtask2,$subtask3,$subtask4,$subtask5,$subtask6,$subtask7,$subtask8,$subtask9,$subtask10,$subtask11,$subtask12,$subtask13,$subtask14,$subtask15,$subtask16
}
taskcommands() {
  echo 'ta - task add'
  echo 'tm - task modify'
  echo 'tc - task annotated (comment)'
  echo 'td - task done'
  echo 'tb - create booking [quote number]'
}
