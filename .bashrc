[ -n "$PS1" ] && source ~/.bash_profile;

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
complete -C /usr/local/bin/vault vault

export PATH=/usr/local/bin:$PATH

[[ -e "/usr/local/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/usr/local/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh"


# Go

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

/Applications/Python\ 3.8/Update\ Shell\ Profile.command 
