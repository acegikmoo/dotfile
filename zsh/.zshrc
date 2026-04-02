# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.user.zsh - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates

#  Plugins 
# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#  Aliases 
# Add aliases here

#  This is your file 
# Add your configurations here
# export EDITOR=nvim

# hack to pick local bin
export PATH="$HOME/.local/bin:$PATH"

# kubectl completions
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

# Load user environment variables and paths
[[ -f ~/.user.zsh ]] && source ~/.user.zsh

# rust (must be before any PATH overrides)
source "$HOME/.cargo/env"

# removes stack size limit for cp
ulimit -s unlimited


# solana
export SOLANA_HOME="$HOME/.local/share/solana/install/active_release/bin"
case ":$PATH:" in
  *":$SOLANA_HOME:"*) ;;
  *) export PATH="$SOLANA_HOME:$PATH" ;;
esac
# solana end

# optional user bin
export PATH="$HOME/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

NODE_OPTIONS="--max-old-space-size=6144"

# Wasmer
export WASMER_DIR="/home/acegikmo/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
