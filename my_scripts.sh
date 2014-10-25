#!/bin/bash
#my_scripts.sh
#Chad A. Moore
#Created April 24, 2014
# Various command line scripts, see .bash_alias for aliases for these funcs

# my_grep_function() - greps thru all the files types in the array below
# and returns matches to a text file and piped to less
#
# grep is called below with the following options;
#   -a  to force read of .html files as text (sometimes mistaken
#        for binary)
#   -n  to output file line number of match
#
# func has parameters:  
#   $1 - search string
#   $2 - for grep options, such as recursive option, 'r' or 'i' for 
#        case insensitivity
#  e.g. To grep in current dir and below, ignoring case sensitivity:
#        $ g ember ri
my_grep_function() {

  FileTypes=( "*.js" "*.php" "*.txt" "*.json" "*.css" "*.html" )

  if [[ -z "$1" ]]; then

    echo "No search string entered...."
    exit

  else
    for t in "${FileTypes[@]}"
    do
      grep -an$2$3 --include "$t" $1 .
    done
  fi

  echo "grepping complete! "
}

my_long_git_stat_func() {

  git status > git.status.txt

  less git.status.txt
}

my_git_stat_func() {

  git status 

}


my_git_graph() {

  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative

}

my_git_graph2() {

  git log --date=short --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --abbrev-commit 

}

my_git_pretty() {
  git log --pretty=format:"%h - %an, %ar : %s"
}

my_tail_func() {
  tail -f $1
}
my_cov_mp_ps_func() {
  ps -e | grep node
  ps -e | grep mongod
  ps -e | grep java
}

print_my_aliases() {
  cat ~/.bash_aliases
}


##functions for executing Curl commands, JSON data is assumed 

# curlGetTest - curl get helper
#   $1 - URL 
curlGetTest() {
  curl --silent --show-error $1  > ./test.json
  python -m json.tool ./test.json 
}
 
# curlPostTest - curl post helper
#   $1 - login data in json format 
#   $2 - URL
curlPostLogin() {

  curl --silent --show-error -X POST -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool ./test.json

}

# curlPostTest - curl post helper
#   $1 - data in json file
#   $2 - URL 
curlPostTest() {

  curl --silent --show-error -X POST -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool ./test.json

}

# curlPutTest - curl put helper
#   $1 - data in json file
#   $2 - URL 
curlPutTest() {

  curl --silent --show-error -X PUT -H"Content-Type: application/json" -d$1 $2 > ./test.json
  python -m json.tool ./test.json

}

# curlDeleteTest- curl delete helper
#   $1 - URL 
curlDeleteTest() {
  curl --silent --show-error -X DELETE $1  > ./test.json
  python -m json.tool ./test.json 
}


# curlGetTestwAuth - curl get helper requiring an Auth Token
#   $1 - Auth Header
#   $2 - URL 
curlGetTestwAuth() {
  curl --silent --show-error -H"$1" $2  > ./test.json
  python -m json.tool ./test.json 
}
 
# curlPostTestwAuth - curl post helper
#   $1 - Auth Header
#   $2 - data in json file
#   $3 - URL 
curlPostTestwAuth() {

  curl --silent --show-error -X POST -H"$1" -H"Content-Type: application/json" -d$2 $3 > ./test.json
  python -m json.tool ./test.json

}

# curlPutTestwAuth - curl put helper
#   $1 - Auth Header
#   $2 - data in json file
#   $3 - URL 
curlPutTestwAuth() {

  curl --silent --show-error -X PUT -H"$1" -H"Content-Type: application/json" -d$2 $3 > ./test.json
  python -m json.tool ./test.json

}

# curlDeleteTestwAuth- curl delete helper
#   $1 - Auth Header
#   $2 - URL 
curlDeleteTestwAuth() {
  curl --silent --show-error -X DELETE -H"$1" $2  > ./test.json
  python -m json.tool ./test.json 
}
