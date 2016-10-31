# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda-mod" # bureau

# Example aliases
alias repo='cd /Volumes/HD/Repo'
alias hosts='sudo vim /etc/hosts'
alias vhosts='sudo vim /Applications/MAMP/conf/apache/httpd.conf'
alias cc='cd /Volumes/HD/htdocs'
alias mm='cd /Volumes/HD/Repo/the-matter-of-memory-website'
alias work='cd /mnt/httpd2/htdocs'
alias cc='cd /mnt/httpd2/htdocs/contests'
alias mamp_start='cd /Applications/MAMP/bin && sudo ./start.sh'
alias mamp_stop='cd /Applications/MAMP/bin && sudo ./stop.sh'
alias gs='git status'
alias gm='git commit -m'

alias vagrant-node='cd ~/complexdevenvironments/vagrant-nodejs/ && vagrant up && vagrant ssh'
alias comdev="cd ~/complexdevenvironments"
alias sub="sudo /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias vagrant-cmde="cd ~/complexdevenvironments/vagrant-cmde/ && vagrant ssh"
alias rss-feed="krill -S /Volumes/HD/Repo/rss-feeds/rss-feed"
alias enlaluz="cd /Volumes/HD/Repo/enlaluz_php/ && clear"
alias tmom="cd /Volumes/HD/Repo/tmom && tmom-mysql && node ."
alias tmomReact="cd /Volumes/HD/Repo/tmomReactNative"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Change "user@hostname" to a regular username when you are logged in as yourself on your local machine
DEFAULT_USER="hector"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx web-search npm)

source $ZSH/oh-my-zsh.sh
#source ~/.nvm/nvm.sh
#source ~/wp-completion.bash

# Customize to your needs...
# /usr/local/sbin
export PATH=/usr/local/bin:/usr/local:~/.composer/vendor/bin:$PATH # Adds Homebrew and Composer binaries
PATH=$PATH:"$HOME/Library/Android/sdk/platform-tools" # Adds Android Debug
export ANDROID_HOME=/usr/local/opt/android-sdk # Adds Android command line from Brew

# export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# TMOM Shortcut
function tmom_start {
    cd /Volumes/HD/repo/tmom/
    docker_running=$(docker-machine ls | grep hector)
    if [[ "$docker_running" == *"Stopped"* ]]
    then
        docker-machine start hector 
        eval "$(docker-machine env hector)"
        env | grep "DOCKER_HOST"
        docker start tmom_mysql_1
    elif [[ "$docker_running" == *"Running"* ]]
    then
        eval "$(docker-machine env hector)"
        docker start tmom_mysql_1
    fi
    open http://localhost:3000 && open http://localhost:3000/explorer
    npm run dev
}

# Docker Machine
alias dochector='docker-machine start hector'
alias dochecenv='eval $(docker-machine env hector)'
alias doctmomstart='docker start tmom_mysql_1'

# Docker commands
alias mysql-docker="docker run --name mysql-server -p 3306 -e MYSQL_ROOT_PASSWORD=tmom -d mysql:latest"
alias mysql-docker-exec="docker exec -it mysql-server bash"

# HAXM related shortcuts - For Android development
alias haxm-check='kextstat | grep intel'
alias haxm-stop='sudo kextunload -b com.intel.kext.intelhaxm'
alias haxm-start='sudo kextload -b com.intel.kext.intelhaxm'
alias haxm-remove='sudo /Library/Extensions/intelhaxm.kext/Contents/Resources/uninstall.sh'

# React-Native shortcuts
alias react-android-start='(nohup emulator -avd Nexus_5_API_23 &) && sleep 15 && cd /Volumes/HD/Repo/tmom-react-native && npm run android'
alias react-kill-android-emulators='adb devices | grep emulator | cut -f1 | while read line; do adb -s $line emu kill; done'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/hectorleiva/.sdkman"
[[ -s "/Users/hectorleiva/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/hectorleiva/.sdkman/bin/sdkman-init.sh"
