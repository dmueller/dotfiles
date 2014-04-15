# rbenv
export RBENV_ROOT=~/.rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
# this should have a test around it in case rbenv doesn't exist
eval "$(rbenv init -)"

# Mostly avoid the jvm from stealing focus
export JRUBY_OPTS="--1.9 --headless -J-XX:MaxPermSize=128m -J-Xmx1024m"
export JAVA_OPTS="$JAVA_OPTS -d32"

# Oracle settings for sqlplus
export TNS_ADMIN=/etc
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2
export PATH="$PATH:$DYLD_LIBRARY_PATH"
export JAVA_HOME=/Library/Java/Home

# Display current git branch on the prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="[\[\033[00m\]\u@\h\[\033[01;34m\] \W \[\033[31m\]\$(parse_git_branch)\[\033[00m\]]$\[\033[00m\] "

# Convenience method to avoid branching off of the currently checked out branch by accident
branch() {
    if [ -n "$1" ]; then
        if [ "$1" == "-r" ]; then
            if [ -n "$2" ]; then
                echo "listing remote branchs containing \"$2\""
                git branch -r | grep "$2";
            else
                echo "listing remote branches";
                git branch -r;
            fi
        else
            # check to see if the branch already exists -- remote or local.
            localbranch=`git branch | grep -c "\s$1$"`
            remotebranch=`git branch -r | grep -c "\sorigin/$1$"`
            if [ $localbranch -gt 0 -o $remotebranch -gt 0 ]; then
                if [ $localbranch -gt 0 ]; then
                    echo "branch $1 exists locally, just checking out the branch";
                    git checkout $1;
                else
                    echo "branch origin/$1 exists remotely, checking out branch to track to remote branch";
                    git checkout -b $1 "origin/$1";
                fi
            else
                if [ -n "$2" ]; then
                    echo "creating branch '$1' off of '$2'";
                    git checkout -b $1 $2;
                else
                    echo "creating branch '$1' off of origin/master";
                    git checkout -b $1 origin/master;
                fi
            fi
        fi
    else
        echo "no branch specified; listing local branches";
        git branch;
    fi
}

# Git aliases
alias b='branch'
alias revert='git checkout --'
alias d='git diff -w'
alias s='git status'

# Rails aliases
alias be="bundle exec"
alias bespec="be rspec spec"
alias bespork="be spork &"
alias drspec="be rspec --drb"

