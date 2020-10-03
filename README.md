## Features

- Code completion and navigation via coc and coc-clangd
- Nice Airline statusbar
- Fuzzy searching for opening files in large repos
- File explorer via Defx
- Git integration (gutter info, blame in statusbar, git graph, in-editor commands)

## Dependencies

### MacOS
    brew install fzy
    brew install ripgrep
    brew install llvm
    brew install nodejs
    brew install npm

    :checkhealth
    :CocInstall coc-json coc-tsserver coc-clangd

Make sure you have latest pynvim python package installed!
Make sure you have latest neovim npm package installed!
Add symbolic link to clangd in /usr/local/bin

## ArchLinux
    sudo pacman -S fzy
    sudo pacman -S ripgrep
    sudo pacman -S llvm
    sudo pacman -S nodejs
    sudo pacman -S npm

    python3 -m pip install --upgrade pynvim
    sudo npm install -g neovim

    :CocInstall coc-json coc-tsserver coc-clangd
