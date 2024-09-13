# How to install

1. Setup ssh config with github [doc](https://docs.gitlab.com/ee/user/ssh.html)
2. Clone this repo into `$HOME`
3. Setup [oh-my-zsh](https://ohmyz.sh/#install) (for terminal) and [vim-plug](https://github.com/junegunn/vim-plug) (for neovim)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

**--> Run the `./install` command now <--**

4. Install homebrew and formulas - requires password
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle
```

Some formulas, might fail because they require Xcode. Once Xcode is installed, re-run `brew bundle`.
Additionally, run this `fzf` command `$(brew --prefix)/opt/fzf/install`

5. Install zsh plugins
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

6. Install neovim plugins and related tools
```bash
nvim --headless +PlugInstall +qa

npm install -g diagnostic-languageserver 
npm install -g bash-language-server 
npm install -g typescript typescript-language-server
# luarocks install luacheck
noglob pip3 install python-lsp-server[all] --break-system-packages
gem install solargraph --user-install
```

7. Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (tpm)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

8. Install lldb "extensions"
```bash
git clone git@github.com:DerekSelander/LLDB.git ~/lldb/LLDB
git clone git@github.com:facebook/chisel.git ~/lldb/chisel
```

## Extra steps
* Configure Alfred
* Configure 1password
* Configure layout using Rectangle
* Configure email using Spark
* Configure Things and Bear with my personal account
* Configure Kindle with my personal email
* Configure keybinds using via

For better debugging and reverse engineering:
* Download [lookin](https://lookin.work)
* Integrate [lookin](https://github.com/QMUI/LookinServer) and [FLEX](https://github.com/FLEXTool/FLEX) into a project (e.g. HelloDebugTools) in order to create artifacts
* Once those two are integrated, update the `lldbinit` flex and look command's paths.
* Download [Hopper](https://www.hopperapp.com)
* Download [sideloadly](https://sideloadly.io/)
* Sign in to the decrypt ipa's website: https://armconverter.com/decryptedappstore/us/
