alias asg='aws sts get-caller-identity | col -b'

alias cdch='cd ${CLI_HELP_DIR}'

alias goi='go install'

alias h='helm'

alias ia='iac-ops'

alias k='kubectl'
alias kccurrent='kubectl config current-context'
alias kcg='kubectl config get-contexts'
alias kcs='kubectl config set-context'
alias kcu='kubectl config use-context'
alias kn='f() { kubectl config set-context --current --namespace=$1 };f'

alias mang='f() { man $1 | col -b | grep -A10 -- $2 };f'

alias n='node'

alias p='python'

alias t='terraform'
alias ti='terraform init'
alias tst='terraform state'
alias tsh='terraform show'

alias y='yarn'
alias yl='yarn lint'
alias yj='yarn test:jest'
alias yjn='yarn test:jest --no-prelint'
alias ys='yarn serve'
alias ysn='yarn serve --no-prelint'
alias yst='yarn start'
