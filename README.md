# Config for Linux

## i3
1. Install i3
2. [Configure i3](https://www.youtube.com/watch?v=j1I63wGcvU4)

__If you want i3-gaps__
[Follow steps here](https://github.com/Airblader/i3)

_My config files is available in this repo (will be updated)_


## Vim / Gvim
Setup for modern Javascript development

### Installation
1. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
2. Open vim
3. Run `PluginInstall`
4. Build [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin

### Shortcuts and tips

__Project tree__
- Hit `ctrl+t` to toggle project tree view
- Hit `enter` to open selected file in current view
- Hit `s` to open selected file in splitted view

__Window / panes__
- Full width: `ctrl+w+|`
- Equal width: `ctrl+w+=`
- Full height: `ctrl+w+_`
- Resize: `ctrl+w -` or `ctrl+w +`.
  - You can also do `ctrl+w 50 -` or `ctrl+w 50 +` to resize with size

__Browse files__
- Hit `ctrl+p` to search for files
- Hit `enter` to open file in current view
- Hit `ctrl+v` to open file in new splitted view
- Hit `ctrl+alt+r` to reveal current file in project tree

__Search files__

With ack:
- Install `ack-grep`
- `:Ack [options] {pattern} [{directories}]`

With vimgrep:
- Search from wanted directory in project tree by navigating to it and hit `cd`
- `vimgrep 'pattern' */**`
- `cw` to list results

__Hightlight words__
- Run `ctrl+alt+d` to toggle highlight mode
- When cursor on word, press `*` to highlight it.
- Press `*` again to go to next and `#` to go to previous

__Get occurence of word in window__
- Hit `[I` on word to get it in window
- Go to line with `:<row-number>`

__Move lines__
- Select lines with `v` in normal mode
- Press `alt+k`/`alt+j` to move selected lines up/down 

__GOTO imported/required definition__
- Set cursor on path
- Hit `ctrl+w+f` to open file in vertical tab

__Sorround words__
- Add: Hello w|orld -> `yss"` => "Hello world"
- Change: "Hello w|orld" -> `cs"'` => 'Hello world'
- Delete: "Hello w|orld" -> `ds"` => Hello world
- [More examples here](http://www.catonmat.net/blog/vim-plugins-surround-vim/)

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
- [x] Add search in all files plugin (just grep)
- [] Add GoTo plugin (will look into ctags)
- [x] Check for even better javascript syntax.
- [] Explore FP tools.
- [] Fix beautiful Nerdtree with icons ([Guide here](https://github.com/ryanoasis/vim-devicons))
- [] Add your own React/Recompose snippets for faster development.
