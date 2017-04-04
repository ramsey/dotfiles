
" Load pathogen
call pathogen#infect()

" Turn on syntax highlighting
syntax on

" Enable loading filetype and indentation plugins
filetype plugin indent on

" Set the vim color theme to Soloarized
let g:solarized_visibility="high"
"let g:solarized_contrast="high"
syntax enable
set background=dark
colorscheme solarized

" Turn off line wrapping
set nowrap

" Color column for finding column 80
"set textwidth=80
"set colorcolumn=+1
"highlight ColorColumn ctermbg=grey guibg=grey

" Hightlight the line the cursor is on
set cursorline
highlight CursorLineNR ctermfg=136

" Configure editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

" Start out with number on
set number

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set encoding=utf-8
set fileencoding=utf-8

" Allow modelines to affect vim behavior
set modelines=1

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4
set expandtab

" Use 4 spaces for <Tab> while performing editing operations, like insert a
" tab or using <BS>
set softtabstop=4

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
autocmd BufWinEnter * match WhitespaceEOL /\s\+$/

" YAML files use 2 spaces, instead of 4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"------------------------------------------------------------------------------
" buftabs.vim Configuration
"------------------------------------------------------------------------------

  " Only print the filename of each buffer
    :let g:buftabs_only_basename=1

  " Show the buftabs in the statusline
  "  :let g:buftabs_in_statusline=1

  " Highlight the active buffer name in the buftab
  "  :let g:buftabs_active_highlight_group="Visual"


"------------------------------------------------------------------------------
" KEY MAPPINGS
"------------------------------------------------------------------------------

  " Various shortcuts for working with tabs
    map ,t :tabnew
    map ,d :tabprev<CR>
    map ,f :tabnext<CR>

  " Shortcuts for working with buffers
    map ,bn :bnext<CR>
    map ,bp :bprev<CR>
    map ,bd :bdelete
    map ,bl :buffers<CR>
    map ,b :buffer

  " NERD Tree
    map ,<TAB>r :NERDTreeMirror<CR>
    map ,<TAB>e :NERDTreeToggle<CR>

  " Toggle line numbers
    map ,# :set nu<CR>
    map ,## :set nonu<CR>

  " Toggle relative line numbers
    map ,r# :set rnu<CR>
    map ,r## :set nornu<CR>

  " Toggle between line numbers and relative line numbers
    nnoremap <C-n> :call NumberToggle()<CR>

  " Toggle line wrapping
    map ,w :set wrap<CR>
    map ,ww :set nowrap<CR>

  " Toggle paste
    map ,pa :set paste<CR>
    map ,npa :set nopaste<CR>

  " New a new line? BR below...
    map brb o<ESC>k

  " New line above...
    map bra O<ESC>j

  " Search and replace
    map ,sr :%s/

  " g + direction for window split change. This beats the hell out of CTRL + W + direction
    map g <C-w>

  " Ensure gg still takes me to the top
    map gg :1<CR>

  " Cleanly close buffers
    map fc <Esc>:call CleanClose(1)
    map fq <Esc>:call CleanClose(0)

  " Replace selected text without destroying your buffer
    map r "_dP


"------------------------------------------------------------------------------
" CUSTOM FUNCTIONS
"------------------------------------------------------------------------------

function! CleanClose(tosave)
    if (a:tosave == 1)
        w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
    else
        bnext
    endif

    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd".todelbufNr
endfunction

function! NumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc


" Powerline
if has('python')
    function LoadPowerline()
        python << EOF
try:
    from powerline.vim import setup as powerline_setup
    powerline_setup()
    del powerline_setup
except ImportError, e:
    pass
EOF
    endfunction
    call LoadPowerline()
endif
