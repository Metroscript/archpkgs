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
  "sets tab size to 4 spaces
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      set expandtab
      
set ruler "always show current position
set cursorline "underlines the current line
set cursorcolumn "highlights the current column
set background=light "makes things darker somehow

  "Remaps
    "rebinds to copy and paste to the system clipboard.
      vmap <silent> <C-c> y:call system("wl-copy", @")<cr>
      map <silent> <C-v> :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
    "rebinds 'jj' to the esckey, Ctrl q to close tab, ctrl t to split tab, ctrl z/y to undo and redo, Ctrl n to newtab and Ctrl f to word search
      imap jj <esc>
      map <C-z> u
      map <C-y> <C-R>
      map <C-f> /
      map <silent> <C-t> :split<CR>
      map <silent> <C-q> :close<CR>
    "simplify split tab navigation
      map <C-h> <C-w>h
      map <C-j> <C-w>j
      map <C-k> <C-w>k
      map <C-l> <C-w>l

"sets unix fileformat and language encoding
  set fileformat=unix
  set encoding=utf-8
set wildmode=longest,list,full "enables autocomplete ctrl+n to activate
set splitbelow splitright "makes split pages open below and to the right
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "disables automatic commenting on a new line
