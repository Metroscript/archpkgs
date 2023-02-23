"VIM CONFIG FILE

"General config
set number "show line numbers
set mouse=a "allows mouse use in all modes
set showmatch "shows matching brackets when the cursor's on them
set spell "enable spellchecking
setlocal spell spelllang=en_au "enable australian english for spell checking
set showcmd "show a partial command in the status line
set autowrite "save before commands such as :make & :next
set hidden "hide abandoned buffers
set autoindent "automatically formats indenting if applicable
filetype indent on "have VIM load indentation rules based on filetype
filetype plugin on "enables syntax support for programming languages
if has ("syntax") "enable syntax highlighting if applicable
  syntax on
endif

"Configure word search
set incsearch "search as you type
set smartcase "prioritise matching case when searching
set ignorecase "search regardless of casing
set hlsearch "highlight search results

"Advanced config
set ruler "always show current position
set cursorline "underlines the current line
set cursorcolumn "highlights the current column
set background=light "makes things darker somehow
"rebinds to copy and paste to the system clipboard.
vmap <C-c> y:call system("wl-copy", @")<cr>
map <C-v> :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
"rebinds 'jj' to the esckey, ctrl z/y to undo and redo
imap jj <esc>
map <C-z> u
map <C-y> <C-R>
"sets unix fileformat and language encoding
set fileformat=unix
set encoding=utf-8
set wildmode=longest,list,full "enables autocomplete ctrl+n to activate
set splitbelow splitright "makes split pages open below and to the right
