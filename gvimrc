:set guifont=overpassmono\ nerd\ font\ mono\ 12
":set signcolumn=yes "Always show errors column
:set laststatus=0
":set noshowmode "don't show --INSERT--
":set noruler "don't show line numbers/column/%

" Oceanic color theme
let g:material_style='oceanic'
set background=dark
colorscheme vim-material
let g:airline_theme='material'


set nocompatible " Use Vim defaults (much better!), Vi is for 70's programmers!


set go-=T " Removes the toolbar
set go-=m  "remove menu bar
set go-=r  "remove right-hand scroll bar
set go-=L  "remove left-hand scroll bar


" 5.1 Working with tabs
"~~~~~~~~~~~~~~~~~~~~~~~
if version >= 700
    " always enable Vim tabs
    set showtabline=2
    " set tab features just like browser
    " open tab, close tab, next tab, previous tab (just like Chrome and Firefox keyboard shortcuts)
    map <C-t> <Esc>:tabnew<CR>
    map <C-F4> <Esc>:tabclose<CR>
    map <C-Tab> <Esc>:tabnext<CR>
    map <C-S-Tab> <Esc>:tabprev<CR>
endif

" 5.2 Working with windows 
    "~~~~~~~~~~~~~~~~~~~~~~~
    " Switch between splits very fast (for multi-file editing) by maximizing target split - http://vim.wikia.com/wiki/VimTip173
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-H> <C-W>h<C-W>|
    map <C-L> <C-W>l<C-W>|
    map <C-=> <C-W>=

" 6. General file editing
    " 6.1 Common Settings to enable better editing
    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        set bs=2 " allow backspacing over everything in insert mode
        set ai " always set autoindenting on

        set showmatch " show matching brackets
        syntax on " Switch on syntax highlighting.
        set hidden " This option allows you to switch between multiple buffers without saving a changed buffer
        set hlsearch " Switch on search pattern highlighting.
        set mousehide " Hide the mouse pointer while typing.

        
        " Easy pasting to windows apps - http://vim.wikia.com/wiki/VimTip21
        " yank always copies to unnamed register, so it is available in windows clipboard for other applications.
        set clipboard=unnamed

        "Set the history size to maximum. by default it is 20 - http://vim.wikia.com/wiki/VimTip45
        set history=80