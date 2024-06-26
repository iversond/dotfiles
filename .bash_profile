# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# *  ~/.path can be used to extend `$PATH`.
# *  ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# *  `autocd`, e.g. `* * /qux` will enter `./foo/bar/baz/qux`
# *  Recursive globbing, e.g. `echo * * /* .txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?* ]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# #########
# AWS Tools
# #########
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME=/opt/ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_URL=https://ec2.us-east-1.amazonaws.com

# Puppet Development Kit
export PATH=$PATH:/opt/puppetlabs/bin/

[[ -e "/Users/dan/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/Users/dan/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh"

# Ruby PATH Settings
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#tmuxinator
source ~/.bin/tmuxinator.bash


# Source Env Vars for Cloud Providers
source ~/.bash_profile_aws
source ~/.bash_profile_oci

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# Bitwarden
source ~/.bw

export PATH=/Users/dan/bin:$PATH

[[ -e "/Users/dan/lib/oracle-cli/lib/python3.8/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/Users/dan/lib/oracle-cli/lib/python3.8/site-packages/oci_cli/bin/oci_autocomplete.sh"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export GEM_PATH=~/.rbenv/versions/2.5.8/lib/ruby/gems/2.5.0/gems/
# Podman
export DOCKER_HOST='unix:///Users/dan/.local/share/containers/podman/machine/qemu/podman.sock'
