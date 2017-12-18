if &compatible
  set nocompatible
end

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" ====================
" PLUGINS
" ====================

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'

" ========== GIT WRAPPER
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" ========== FIND FILES
Plugin 'ctrlpvim/ctrlp.vim'

" ========== PROJECT TREE
Plugin 'scrooloose/nerdtree'

" ========== MOVE SELECTED LINES
Plugin 'matze/vim-move'

" ========== INDENTATION LINE CHARACTER
Plugin 'Yggdroot/indentLine'

" ========== ESLINT
Plugin 'w0rp/ale'

" ========== EDITOR CONFIG
Plugin 'editorconfig/editorconfig-vim'

" ========== AUTOCOMPLETE PAIRS
Plugin 'jiangmiao/auto-pairs'

" ========== MARK MULTIPLE WORDS
Plugin 'terryma/vim-multiple-cursors'

" ========== AUTO CLOSE XML/HTML TAGS
Plugin 'alvan/vim-closetag'

" ========== GOTO DEFINITION
Plugin 'moll/vim-node'

" ========== SNIPPETS
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'honza/vim-snippets'
Plugin 'groenewege/vim-less'
Plugin 'othree/javascript-libraries-syntax.vim'

" ========== MARKDOWN
Plugin 'iamcco/markdown-preview.vim'

" ========== CODE SYNTAX
Plugin 'leshill/vim-json'
Plugin 'mhartington/oceanic-next'
Plugin 'morhetz/gruvbox'
Plugin 'endel/vim-github-colorscheme'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call vundle#end()
filetype on

" ====================
" CONFIG FOR PLUGINS
" ====================

" ========== EDITOR RULES AND LOOK
syntax enable
set background=dark
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
set fillchars+=vert:\$
set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=4 sw=4 et
set shiftwidth=2
set tabstop=2
let &colorcolumn="80"
set cursorline
set noswapfile
set splitbelow
set splitright
set spelllang=en_gb
set nostartofline
set linebreak
augroup filetype javascript syntax=javascript
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999

" ========== AUTO CLOSE HTML TAGS
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'

" ========== INDENT LINE CHARACTER
let g:indentLine_char = '│'

" ========== REACT/JSX HIGHLIGHT SYNTAX
let g:jsx_ext_required = 0

" ========== ESLINT
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
nmap <C-A-f> <Plug>(ale_fix) " Shortcut for lint fix

" ========== SNIPPETS
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" ========== FIND FILES
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage'

" ========== MULTI CURSOR
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ========== PREVIEW
let vim_markdown_preview_github=1

" ========== JS LIBS
let g:used_javascript_libs = 'underscore,react,ramda,d3,chai,jasmine,requirejs,angularjs'

" ========== GOTO DEFINITION
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" ========== PROJECT TREE
"autocmd vimenter * NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set secure
