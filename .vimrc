call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdcommenter' "Plug 'mattn/emmet-vim'

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

"Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

if has('nvim')
	Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

set encoding=UTF-8
set mouse=a

let g:airline_powerline_fonts = 1

"nmap <F6> :NERDTreeToggle<CR>
nmap ff :NERDTreeToggle<CR>
nmap <C-_>   <Plug>NERDCommenterToggle
imap ii <Esc>

command! -nargs=0 Sw w !sudo tee % > /dev/null

set number 		" Show line numbers
set linebreak 		" Break lines at word (requires wrap lines)
set showbreak=-> 	" Wrap-broken line prefix
set showmatch 		" Highlight matching brace

set hlsearch 		" Highlight all search results
set smartcase 		" Enable smart-case search
set ignorecase 		" Always case-insensitive
set incsearch 		" Searches for strings incrementally

set autoindent		" Auto-indent new lines
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs

set ruler		" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start

syntax on		" Enable syntax-highlighting
highlight Normal ctermbg=None "Force transparent background
colorscheme onedark 
