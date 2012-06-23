" use vim settings, instead of vi compatablity
" must be at start of file
set nocompatible

" enable filetype detection and indentation for specifc filetypes
syntax on
filetype plugin indent on

" change mapleader from \ to ,
let mapleader=","

set showmode                      " show the current command in the statusline
set tabstop=2                     " number of spaces that a tab counts for
set softtabstop=2                 " number of spaces to use for each step of indent
set expandtab                     " expand tabs to spaces
set shiftwidth=2                  " number of spaces to use for each step of indent
set backspace=indent,eol,start    " define behavior of backspace key
set autoindent                    " automatically indent a new line
set smartindent                   " smartly indent a new line
set showmatch                     " set show matching parenthesis
set ignorecase                    " ignore case in (search) patterns
set scrolloff=4                   " minimal number of screen lines to keep above and below the cursor.
set hlsearch                      " highlight all the matches for the search
set incsearch                     " while searching, immediately show first match
set gdefault                      " search/replace globally (on a line) by default
set wrap                          " enable wrapping of text
set encoding=utf-8                " by default set the encoding to UTF-8
set laststatus=2                  " always show the statusline
set linespace=3                   " set height of each line
set nobackup                      " don't make a (permanent) backup when saving files
set noswapfile                    " disable swap files, most of the time they are just annoying
set relativenumber                " show relative line number from current line position
set wildmenu                      " show command line completions
set wildmode=list:longest         " complete mode for wildmenu
set title                         " set the title
set visualbell                    " don't beep
set noerrorbells                  " don't beep
set showcmd                       " show (partial) command in the last line of the screen
set nomodeline                    " disable mode lines (security measure)
set splitbelow                    " open a new horizontal window below the current window instead of above
set autoread                      " automatically reload the file when modified outside and not modified inside vim
set autowrite                     " write the modified file when switching to another file
set hidden                        " allow Vim to switch to another buffer while the current is not saved
set lines=40                      " set the height of window
set columns=140                   " set the width of window
if exists('+autochdir')
  set autochdir                   " automatically change to the current directory when loading a file
endif

" remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" save a couple of keystrokes
nmap <space> :

" auto-source vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" file size function for status line
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes . "b"
  else
    return (bytes / 1024) . "k"
  endif
endfunction

" custom status line
set statusline=                                              " completely reset statusline
set statusline+=%f\                                          " relative path of the file
set statusline+=#%n~%{winnr()}\                              " buffer number
set statusline+=%1*%m%r%*\ \                                 " modified flag and read only flag
set statusline+=[%{strlen(&filetype)?&filetype:'none'},      " filetype
set statusline+=%{strlen(&fenc)?&fenc:'none'},               " file encoding
set statusline+=%{&ff}]                                      " file format
set statusline+=%=                                           " left/right separator
set statusline+=[%{&wrap?'wrap':'nowrap'},                   " wrap state
set statusline+=%{&expandtab?'spaces':'tabs'}:%{&tabstop}]\  " expand tab and tab stop info
set statusline+=%{FileSize()}\                               " filesize
set statusline+=%l/%L:%-3c                                   " cursor line/total lines:cursor column
set statusline+=\ %P                                         " percent through file

" custom title string
set titlestring=                               " completely reset titlestring
set titlestring+=%t                            " the current filename
set titlestring+=%(\ %M%)                      " modified flag
set titlestring+=%(\ (%{expand(\"%:~:h\")})%)  " relative path to current file
set titlestring+=%(\ %a%)                      " extra attributes

" themeing
colorscheme desert

if has ("gui_running")
  set guifont=Menlo:h20
  " Remove toolbar, left scrollbar and right scrollbar
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
else
  let g:solarized_termcolors=256
endif

" use ,d (or ,dd, dj) t delete a line without adding it to the yanked stack
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" quick yank to end of line
nmap Y y$