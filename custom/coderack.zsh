# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
alias bi=bundle install
# Example aliases
alias e="mine"
alias ezsh="e ~/.zshrc"
alias ohmyzsh="e ~/.oh-my-zsh"
alias spot='mdfind -onlyin `pwd`'
alias be='bundle exec'
alias web='chrome-cli open'
alias inbox='chrome-cli open https://inbox.google.com'
alias codebox='chrome-cli open https://inbox.google.com/u/2'
alias gweepbox='chrome-cli open https://inbox.google.com/u/1'
alias music='open /Applications/Radiant\ Player.app'
alias pmusic='open /Applications/Amazon\ Music.app'
alias weather='chrome-cli open https://darksky.net/forecast/42.6612,-70.9967'
alias git='hub'
killRuby() {
	killall -v -SIGKILL -m ruby(?!mine)
	killall -v -SIGKILL -m puma.
}

alias killr=killRuby
alias cl=clear
alias fs='foreman start'
alias bu='bundle update'

gitReport() {
    #do things with parameters like $1 such as
    git log --all --date=iso --author=$1 --after=$2 --before=$3 --pretty=format:'%h %ad%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08 %s %d'

}
alias report=gitReport

localHost() {
    chrome-cli open http://lvh.me:$1/$2
}

alias lh=localHost
alias cm="cd ~/code/college-measures"
alias ia="cd ~/code/interview-app"
alias sa="cd ~/code/smartaide"
alias hobson="cd ~/code/hobson-app"
alias analyze="git diff --name-only master | xargs codeclimate analyze"

function al
{
   alias | grep $*
}

alias ali='al -i'
