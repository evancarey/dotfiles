
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"  call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end
Plugin 'git@github.com:tpope/vim-fugitive.git'
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'git@github.com:xolox/vim-misc.git'
Plugin 'git@github.com:xolox/vim-easytags.git'
Plugin 'git@github.com:scrooloose/syntastic.git'
Plugin 'git@github.com:bling/vim-airline.git'
Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'git@github.com:mattn/emmet-vim.git'
Plugin 'git@github.com:flazz/vim-colorschemes.git'
Plugin 'git@github.com:christoomey/vim-tmux-navigator.git'
Plugin 'git@github.com:jeffkreeftmeijer/vim-numbertoggle.git'
Plugin 'git@github.com:nathanaelkane/vim-indent-guides.git'
Plugin 'git@github.com:ryanoasis/vim-webdevicons.git'

" All of your Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList           - lists configured plugins
" :PluginInstall        - installs plugins; append '!' to update or just :PluginUpdate
" :PluginSearch foo     - searches for foo; append '!' to refresh local cache
" :PluginClean          - confirms removal of unused plugins; append '!' to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set hlsearch
set number
set ruler
set clipboard=unnamed

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
vnoremap // y/<C-R>"<CR>

colorscheme monokai
set background=dark

set colorcolumn=80
highlight ColorColumn guibg=#004000

map <C-n> :NERDTree<CR>
map <C-m> :TagbarToggle<CR>

set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

syntax on

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"
function OpenNERDTree()
        execute ":NERDTree"
endfunction
command -nargs=0 OpenNERDTree :call OpenNERDTree()
nmap <ESC>t :OpenNERDTree<CR>

let g:indent_guides_exclude_filetypes = ['nerdtree']
let g:indent_guides_enable_on_vim_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let NERDTreeIgnore=[ '\.DS_Store$' ]

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

set guifont=Inconsolata\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14

