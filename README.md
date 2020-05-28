# MyGlobalBashAliases
This is my global bash aliases file that can be source in any Unix like OS.

## Setups

### Bash 

1. create links into MyGlobalBashAliases
2. add add_it_to_bashrc lines into ~/.bashrc

### SSH

1. Generate the ssh key

```bash
ssh-keygen -t ecdsa -b 521 # Generate your ssh key default location ~/.shh/
ssh-copy-id user@host  # Add your key to One host in each environment (Dev, Test, Prod)
# Test it: Add ssh agent to your termina. Note: assh fucntion should be on your bash aliases 
eval `ssh-agent` && ssh-add
```

### vim 

1. Cd to home direcoty and run

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. Launch vim and run :PluginInstall


## Installation

### All distribution

1. git
2. python3
3. ansible

### Redhat

1. ```dnf install bind-utils``` # for dig application on redhat family os





