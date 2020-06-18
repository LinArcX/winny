"syntax enable        " syntax highlighting
""set cursorline

filetype on          " Enable file type detection
filetype plugin on   " This line enables loading the plugin files for specific file types
"
"syntax off
"set colorcolumn=80   " Draw a vertical line in column 80
"set background=light
"hi ColorColumn ctermbg=DarkGray
"
"set paste
"
"set foldmethod=indent
"set foldnestmax=10
"set foldenable
"set foldlevel=2
"
"set list
"set exrc
"set secure
set number           " Display Relative line numbers
"set nowrap           " Don't Wrap lines!
"set hidden
"set cindent          " This turns on C style indentation
"set undofile         " Maintain undo history between sessions
"set autowrite
"set smartcase
"set expandtab        " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
"set showmatch        " Show matching braces but not for too long
"set noswapfile       " Avoid swap files
"set ignorecase
"set splitright
"set splitbelow       " Open windows as split always in below or right
"set noautochdir      " Don't change directory(it's important for build projects)
"set smartindent      " Smart indent
"set arabicshape!

"set shell=powershell
"set shellcmdflag=-command
"set shellquote=\"
"set shellxquote=
"
"set wildignore+=*.swp"
"set wildignore+=*.pyc,*.pyo
"set wildmode=list:longest,full
"set wildignore+=.DS_Store,Thumbs.db
"set wildignore+=*.so,*.dll,*.exe,*.lib,*.pdb
"
"set mouse=a          " Mouse Integration
"set path+=**         " For clever completion with the :find command
""set t_Co=256         " makes Vim use 256 colors
"set tabstop=4        " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
"set nocompatible     " Enter the current millenium " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
"set shiftwidth=4     " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
"set softtabstop=4    " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
"" set clipboard=unnamedplus
"
"let mapleader = "," " change \ to ,
"let maplocalleader = ","
"" let g:python3_host_prog="/bin/python3"
"
""function! ShowFullPath()
""    set statusline=
""    set laststatus=2
""    set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*\ %{expand('%:p:h')}\%#warningmsg#
""    set statusline+=
""    set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
""    set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
""    set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
""    "let timer = timer_start(3000, 'ResetStatusLine')
""endfunction
""
""au TermOpen * set bufhidden=hide "keep terminal open even if you leave it:)
""au TermOpen  * setlocal nonumber | startinsert
""au TermClose * call feedkeys("i")
""au bufread,bufnewfile *.md set filetype=md
""au BufRead,BufNewFile .envrc set filetype=sh
""au bufread,bufnewfile *.srt set filetype=srt
""au bufread,bufnewfile *.vala set filetype=vala
""au BufEnter,BufNewFile * call ShowFullPath()
"
"" tnoremap <Esc> <C-\><C-n>
"" tnoremap <C-[> <C-\><C-n>
"" tnoremap <Esc> <C-\><C-n>:bd!<CR>
"" command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>
"
"" show spaces
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"
"" set colorscheme
""set background=dark
""colorscheme hybrid_material
"
"" completion
"set omnifunc=syntaxcomplete#Complete
"set wildmode=list,full
"set completeopt=menuone,preview
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"
"
"function! InsertTabWrapper()
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"          return "\<tab>"
"  else
"          return "\<c-p>"
"  endif
"endfunction
"inoremap <expr> <tab> InsertTabWrapper()
"inoremap <s-tab> <c-n>
