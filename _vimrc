" -----------------------------------------------------------------------------
" Basic options for VIM on Windows 11
" -----------------------------------------------------------------------------
"
" TEMP COMMENTED
" set scl=yes  " debug column - useful outside plugins?
" set formatoptions+=w
" set textwidth=80
" augroup YankHighlight
"     autocmd!
"     autocmd TextYankPost * silent! call matchadd('Search', @", 1)
"     autocmd TextYankPost * silent! call matchadd('IncSearch', @", 1)
" augroup END

filetype on
syntax on
filetype plugin on
filetype indent on
colorscheme shine

set directory=~/vimfiles/swp//
set backupdir=~/vimfiles/backup//
set undodir=~/vimfiles/undo//

nnoremap <Space>e :Explore<CR>
nnoremap <Space>v :Vexplore<CR>
nnoremap <Space>s :Sexplore<CR>
nnoremap <Space>b :ls<CR>:b
nnoremap <Space>g :g/

set number
set cursorline
set ruler
set enc=utf-8
set t_Co=256
set mouse=a

set nowrap
set hlsearch
set ignorecase
set smartcase
set showmatch
set showmode
set showcmd
set ignorecase
set smartcase
set splitright
set splitbelow
set list
set listchars=tab:»\ ,trail:·,nbsp:␣
set scrolloff=3
set modeline        " folding/unfolding
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
    " (happens when dropping a file on Gvim).
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

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
set laststatus=2
set noshowmode " Mode already displayed on statusline
set statusline=%{ShowMode()}\ %t\ B:%n\ [%{&fileformat}\ :\ %{&fileencoding}]
set statusline+=%m%r%h%w\ %=\ %y\ %l:%c\ (%p%%)
