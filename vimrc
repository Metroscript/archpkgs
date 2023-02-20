"VIM CONFIG FILE

set number "show line numbers
set mouse=a "allows mouse use in all modes
set showmatch "shows matching brackets when the cursor's on them
set spell "enable spellchecking
setlocal spell spelllang=en_au "enable australian english for spell checking
set showcmd "show a partial command in the status line
set autowrite "save before commands such as :make & :next
set novisualbell "disable error flashes
set noerrorbells "Disable error sounds
set hidden "hide abandoned buffers
filetype indent on "have VIM load indentation rules based on filetype
filetype plugin on "enables syntax support for programming languages
if has ("syntax") "enable syntax highlighting if applicable
  syntax on
endif

set incsearch "search as you type
set smartcase "prioritise matching case when searching
set ignorecase "search regardless of casing
set hlsearch "highlight search results

set ruler "always show current position
set background=light "makes things darker somehow
nmap <leader>w :w!<cr> "use 'w' to quicksave
set clipboard=unamedplus "makes the default clipboard the system clipboard
"rebinds to copy to the system clipboard. Requires gvim
vnoremap <C-c> "+y
map <C-p> "+P
set autoindent "automatically formats indenting if applicable
set fileformat=unix
set encoding=utf-8
set wildmode=longest,list,full "enables autocomplete ctrl+n to activate
set splitbelow splitright "makes split pages open below and to the right
autocmd BufWritePre * %s/\s/+$//e "automatically deletes trailing blank spaces on save
