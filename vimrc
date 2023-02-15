"VIM CONFIG FILE"

set number "show line numbers"
"allows mouse use"
set mouse=a
"shows matching brackets when the cursor's on them"
set showmatch
"enable spellchecking"
set spell
"disable error flashes"
set novisualbell
"Disable error sounds"
set noerrorbells
"hide abandoned buffers"
set hid
"enable syntax highlighting if applicable"
if has ("syntax")
  syntax on
endif

"search as you type"
set incsearch
"prioritise matching case when searching"
set smartcase
"search regardless of casing"
set ignorecase
"highlight search results"
set hlsearch

"always show current position"
set ruler
