# Config for Linux

## Vim / Gvim
Setup for modern Javascript development

### Installation
1. Open vim
2. Run `PluginInstall`
3. Build YouCompleteMe plugin
  - `cd ~/.vim/bundle/YouCompleteMe/ && python install.py`

### Shortcuts and tips

__Project tree__
- Hit `ctrl+t` to toggle project tree view
- Hit `enter` to open selected file in current view
- Hit `s` to open selected file in splitted view

__Search files__
- Hit `ctrl+p` to search for files
- Hit `enter` to open file in current view
- Hit `ctrl+v` to open file in new splitted view

__Move lines__
- Select lines with `v` in normal mode
- Press `alt+k`/`alt+j` to move selected lines up/down 

__Select (multiple) words__
- Put cursor on word
- Hit `ctrl+d` to select next word and `ctrl+k` to jump over word
- Hit `c` to start typing on selected word

__Useful GIT commands__
- Changed code will be visible in editor
- Git status: Type `GStatus`
  - Then you can hit `enter` on selected file to open it
- Splitted diff: Type `GDiff`
- Open a .md file and type `MarkdownPreview` in normal mode to preview it 

__Eslint__
- Linting errors will be visible in editor based on eslint/prettier
- Linting errors will be fixed on save
- `ctrl+alt+f` to fix linting errors in normal mode

### TODOs
- Add search in all files plugin.
- Add GoTo plugin.
- Check for even better javascript syntax.
- Explore FP tools.
- Add your own React/Recompose snippets for faster development.
