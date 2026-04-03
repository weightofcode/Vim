" Basic options for VIM on Windows 11

filetype on
filetype plugin on
filetype indent on
syntax on
colorscheme shine
noremap <Space>e :Explore<CR>
noremap <Space>v :Vexplore!<CR>

set ruler
set enc=utf-8
set t_Co=256
set mouse=a
" set number
" set cursorline
set nowrap
set hlsearch
set ignorecase
set smartcase
set showmatch
set showmode
set showcmd
set ignorecase
set smartcase
set scl=yes         " check if this is useful outside plugins
set splitright
set splitbelow
set list
set listchars=tab:»\ ,trail:·,nbsp:␣
set scrolloff=3
set modeline        " for folding/unfolding
set modelines=5

set smartindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set wildmode=longest,list,full
set wildmenu

if has("autocmd")
    autocmd FileType text setlocal
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

set laststatus=2
set noshowmode " don't show Mode since it's displayed on statusline
function! ShowMode()
    let mode_map = {
                \ 'n': 'NORMAL',
                \ 'i': 'INSERT',
                \ 'R': 'REPLACE',
                \ 'v': 'VISUAL',
                \ 'V': 'V-LINE',
                \ "\<C-v>": 'V-BLOCK',
                \ 'c': 'COMMAND',
                \ 's': 'SELECT',
                \ 'S': 'S-LINE',
                \ "\<C-s>": 'S-BLOCK',
                \ }
    return get(mode_map, mode(), mode())
endfunction
set statusline=%n\ %{ShowMode()}\ %t\ [%{&fileformat}\ :\ %{&fileencoding}]\ %m%r%h%w\ %=\ %y\ %l:%c\ (%p%%)
" set statusline=%n\ %{mode()}\ %f\ [%{&fileformat}\ :\ %{&fileencoding}]\ %m%r%h%w\ %=\ %y\ %l:%c\ (%p%%)
