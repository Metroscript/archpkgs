"VIM CONFIG FILE"

set number "show line numbers"
set mouse=a "allows mouse use"
set showmatch "shows matching brackets when the cursor's on them"
set spell "enable spellchecking"
set novisualbell "disable error flashes"
set noerrorbells "Disable error sounds"
set hid "hide abandoned buffers"
if has ("syntax") "enable syntax highlighting if applicable"
  syntax on
endif

set incsearch "search as you type"
set smartcase "prioritise matching case when searching"
set ignorecase "search regardless of casing"
set hlsearch "highlight search results"

set ruler "always show current position"
