" PLUGINS ----------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')

" Project tree
Plug 'scrooloose/nerdtree'  

" Themes
Plug 'crusoexia/vim-monokai'
Plug 'haishanh/night-owl.vim'
Plug 'endel/vim-github-colorscheme'

" Coding
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" FZF 
Plug 'junegunn/fzf' , { 'do' : { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'

" Complete html, functions, strings...
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/surround.vim'

" GIT integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Status bar on bottom
Plug 'bling/vim-airline'

" Show hex colors
Plug 'gko/vim-coloresque'

" TS server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

call plug#end()
" }}}

" NATIVE SETTINGS --------------------------------------------------------- {{{

" Enable code folding by section in this file
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Disable compability with VI to avoid unexpected issues.
set nocompatible

" Enable file type detection
filetype on

" Enable plugins and load them for the file type
filetype plugin on

" Load an indent file for the file type
filetype indent on 

" Enable syntax highlighting
syntax on

" Display line numbers
set number

" Hightlight cursor line below cursor horizontally
set cursorline

" Show column break
let &colorcolumn="80" 

" Shift width 2 spaces
set shiftwidth=2

" Set tabstop to 2 columns
set tabstop=2

" Auto indent
set smartindent

" Use space char instead of tab
set expandtab

" Disable save backup files
set nobackup
set nowritebackup

" Disable swap files
set noswapfile

" Open new horizontal window below
set splitbelow 

" Open new vertical window on right
set splitright 

" English spelling
set spelllang=en_bg 

" Prevent cursor from changing the current column
set nostartofline 

" Linebreak
set linebreak

" Encoding
set encoding=utf8

" Avoid scrolling below or above number of lines when scrolling
set scrolloff=18

" Disable wrap lines 
set nowrap

" Incrementally highlight matching characters as you type
set incsearch

" Ignore capital chars when searching
set ignorecase
" set smartcase <- Capital letters

" Show partial command you type in the last line of the screen
set showcmd

" Show the mode in the last line
set showmode

" Show matching words during a search
set showmatch

" Highlight search result
set hlsearch

" Larger history
set history=1000

" Enable auto completion menu after pressing TAB
set wildmenu

" Make wildmenu similar to bash completion
set wildmode=list:longest

" Disable files that we don't want to edit with VIM
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Enable mouse
set mouse=a

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Remove menu and scroll bar
set guioptions-=m 
set guioptions-=T 
set guioptions-=r
set guioptions-=L

" Fix scroll lag
set lines=999 columns=999

" Folding
set foldmethod=indent
set foldlevel=0
set foldnestmax=1

" Theme
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme night-owl
" colorscheme github
" colorscheme monokai

" Font
set guifont=Ubuntu\ Mono\ 12

" ------------------------------------------------------------------------- }}}

" SETTINGS & MAPPINGS ----------------------------------------------------- {{{

" Toggle hlsearch 
nnoremap <nowait><silent> <C-c> :set hlsearch!<CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree 
let g:NERDTreeHijackNetrw=0
let g:NERDTreeWinSize = 60
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.s    wh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let NERDTreeShowHidden = 1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows = 0
nmap <C-t> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Browse files 
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Ag<Cr>

" Auto pairs only for )}]
let g:AutoPairsFlyMode = 1

" GIT integration
set updatetime=250
let g:gitgutter_enabled = 1
let vim_markdown_ipreview_github=1

" Complete html, functions, strings...
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.ts,*.tsx,*.html.erb,*.md'

" CocServer settings ---------------------------------------------------------

let mapleader = " "

" Linting
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gnd <Plug>(coc-diagnostic-next)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>.  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>fq  <Plug>(coc-fix-current)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Lists
nmap <silent> <leader>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

" TODO avoid showing only errors on hover if error
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction
function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction
autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Make sure syntax highlighting is in sync
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ------------------------------------------------------------------------- }}}

" NOTES ------------------------------------------------------------------- {{{

" TODOs
" [] Search and replace across multiple files?

" }}}
