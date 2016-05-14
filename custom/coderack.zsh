# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
alias bi=bundle install
# Example aliases
alias zshs="atom ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias spot='mdfind -onlyin `pwd`'
alias be='bundle exec'
alias web='chrome-cli open'
alias lh='chrome-cli open http://lvh.me:3000'
alias cs='chrome-cli open https://codeship.com/coderack'
alias music='chrome-cli open https://play.google.com/music/listen?u=0'
alias pmusic='open /Applications/Amazon\ Music.app'
alias weather='chrome-cli open http://forecast.io/#/f/42.7195,-70.9925'
alias git='hub'
killRuby() {
	killall -9 ruby
	pkill puma
}

alias killr=killRuby
alias cl=clear
alias fs='foreman start'
alias bu='bundle update'

gitReport() {
    #do things with parameters like $1 such as
    git log --all --date=iso --author=$1 --after=$2 --before=$3 --pretty=format:'%ad%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08 %s'

}
alias report=gitReport
