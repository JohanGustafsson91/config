" ============================================================================
" Plugins
" ============================================================================

if &compatible
  set nocompatible
end

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Package manager
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'

" Themes
Plugin 'gosukiwi/vim-atom-dark' 
Plugin 'mhartington/oceanic-next'

" Project tree
Plugin 'scrooloose/nerdtree'

" Browse files
Plugin 'ctrlpvim/ctrlp.vim'

"Search in files
Plugin 'mileszs/ack.vim'

" GIT integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'iamcco/markdown-preview.vim'

" Indentation character
Plugin 'Yggdroot/indentLine'

" Status bar on bottom
Plugin 'bling/vim-airline'

" Es lint
Plugin 'w0rp/ale'

" Move lines
Plugin 'matze/vim-move'

" Complete html, functions, strings...
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
Plugin 'vim-scripts/surround.vim'

" Auto complete
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'

" Snippets
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'honza/vim-snippets'
Plugin 'groenewege/vim-less'

" JS libs
Plugin 'othree/javascript-libraries-syntax.vim'

" JS editor syntax
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'othree/yajs.vim', { 'for': 'javascript' }
Plugin 'othree/es.next.syntax.vim'
Plugin 'vim-scripts/Enhanced-Javascript-syntax'

" Jump to required/imported file
Plugin 'moll/vim-node'

" Start screen
Plugin 'mhinz/vim-startify'

" Editor config
Plugin 'editorconfig/editorconfig-vim'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call vundle#end()
filetype on

" ============================================================================
" End of Plugins
" ============================================================================

" ****************************************************************************
" Plugin config
" ****************************************************************************

" ============================================================================
" Theme / editor 

syntax enable
set background=dark
colorscheme atom-dark

set ruler " Enable thins below
set hidden " Hide no write since changed messages
set number " Row numbers
set laststatus=2 " Always display status line
set smartindent " Auto indent
set ts=2 " 2 spaces tab
set sw=2 " 2 spaces shift width
set shiftwidth=2
set tabstop=2
set et " Expand tabs to spaces
set cursorline " Hightlight line where cursor is
set noswapfile " Dont make swap files
set splitbelow " Open new horizontal window below
set splitright " Open new vertical window on right
set spelllang=en_bg " English spelling
set nostartofline " Prevent cursor from changing the current column
set linebreak " Line break
let &colorcolumn="80" " Show column break
augroup filetype javascript syntax=javascript " JS syntax
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove toolbar
set guioptions-=r " Remove right-hand scroll bar
set guioptions-=L " Remove left-hand scroll bar
set lines=999 columns=999
set fillchars+=vert:\$

" Navigate in windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set ignorecase " Ignore case sensitive
nmap <silent> <C-A-d> :set hlsearch!<CR> " Hightlight words

let g:indentLine_char = '│'


" ============================================================================
" Project tree

let g:NERDTreeWinSize = 60
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let NERDTreeShowHidden = 1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows = 0
nmap <C-t> :NERDTreeToggle<CR>


" ============================================================================
" Browse files

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage|build|dist'
let g:ctrlp_match_window = 'results:100'


" ============================================================================
" GIT integration

set updatetime=250
let g:gitgutter_enabled = 1
let vim_markdown_ipreview_github=1


" ============================================================================
" Es lint

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 0
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
nmap <C-A-f> <Plug>(ale_fix) " Shortcut for lint fix


" ============================================================================
" Auto complete

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']


" ============================================================================
" JS libs

let g:used_javascript_libs = 'underscore,react,ramda,d3,chai,jasmine,requirejs,angularjs'


" ============================================================================
" Complete html, functions, strings...

let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'


" ============================================================================
" Jump to required/imported file

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif 


" ============================================================================
" JS editor syntax
let g:jsx_ext_required = 0


" ****************************************************************************
" End of Plugin config
" ****************************************************************************

set secure
