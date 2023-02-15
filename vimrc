"VIM CONFIG FILE

set number "show line numbers
set mouse=a "allows mouse use in all modes
set showmatch "shows matching brackets when the cursor's on them
set spell "enable spellchecking
set showcmd "show a partial command in the status line
set autowrite "save before commands such as :make & :next
set novisualbell "disable error flashes
set noerrorbells "Disable error sounds
set hidden "hide abandoned buffers
if has ("syntax") "enable syntax highlighting if applicable
  syntax on
endif

set incsearch "search as you type
set smartcase "prioritise matching case when searching
set ignorecase "search regardless of casing
set hlsearch "highlight search results

set ruler "always show current position
set background=dark
nmap <leader>w :w!<cr> "use 'w' to quicksave

filetype plugin indent on "have VIM load indentation rules and plugins based on filetype
