"==================================
"= Vundle settings 
"==================================

" be iMproved, required
set nocompatible              
" required
filetype off                  

" set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
    set rtp+=~/vimfiles/bundle/vundle.vim/ 
    call vundle#begin('~/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle.vim'

" Plugins goes here
" ---------->
" useful file manager
Plugin 'scrooloose/nerdtree'
" cool status line
Plugin 'bling/vim-airline'
" themes for vim-airline
Plugin 'vim-airline/vim-airline-themes'
" cool status line for tmux
Plugin 'edkolev/tmuxline.vim'
" html and css writing accelerator
Plugin 'mattn/emmet-vim'
" working with git
Plugin 'tpope/vim-fugitive'
" plugin for catching focus events for vim
" used to update opened file, if it was changed outside
Plugin 'tmux-plugins/vim-tmux-focus-events'
" cool text navigation
Plugin 'Lokaltog/vim-easymotion'
" fuzzy search by files 
Plugin 'kien/ctrlp.vim'
" Multilangual syntax checker
Plugin 'scrooloose/syntastic'
" fast commenting/uncommenting a source code
Plugin 'tomtom/tcomment_vim'
" comfortable indent visualisation
Plugin 'Yggdroot/indentLine'
" indents for html and js
Plugin 'lukaszb/vim-web-indent'
" comfortable startup screen and session management
Plugin 'mhinz/vim-startify'
" comfortable pair braces etc. autocomplete
Plugin 'raimondi/delimitmate'
" plugin for management of text surrounding with any stuff
Plugin 'tpope/vim-surround'
" stylus highlighting and indentation
Plugin 'wavded/vim-stylus'
Plugin 'cakebaker/scss-syntax.vim'
" less highlighting and indentation
Plugin 'groenewege/vim-less'
" jade highlighting
Plugin 'digitaltoad/vim-pug'
" toml syntax highlighting
Plugin 'cespare/vim-toml'
" rust lang syntax highlighting and file detection
Plugin 'wting/rust.vim'
" fast real-time code-completion tool
Plugin 'Valloric/YouCompleteMe'
" source code snippets plugin
Plugin 'SirVer/ultisnips'
" snippets for ultisnips plugin
Plugin 'honza/vim-snippets'
" Vue components syntax highlighing
" Plugin 'posva/vim-vue'
Plugin 'darthmall/vim-vue'
" PHP completion plugin
Plugin 'shawncplus/phpcomplete.vim'
" PHP indentation plugin
Plugin '2072/PHP-Indenting-for-VIm'
" Vim debugging plugin
Plugin 'joonty/vdebug'
" Convenient sidebar with all tags for current file indexed by ctags
Plugin 'majutsushi/tagbar'
" <---------

call vundle#end()            
filetype plugin indent on   


"==================================
"= Colors and color theme
"==================================

syntax enable
set background=dark
colorscheme molokai 
let g:rehash256 = 1


"==================================
"= GUI
"==================================

if has('gui_running') 
     set guioptions=gc 
     
    if has('win32') || has('win64')
        " console font
        set guifont=Consolas\ for\ Powerline\ FixedD:h11:cRUSSIAN
        " correct cyrillic in inner vim messages
        lan mes ru_RU.UTF-8
        " backspace issue solution
        set backspace=indent,eol,start
        " we don't need mouse
        set mouse=""
    else
        set guifont=Droid\ Sans\ Mono\ For\ Powerline
    endif
else
    set t_Co=256
    " Allows cursor change in tmux mode
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endif


"==================================
"= Common vim behavior
"==================================

" enabling syntax highlighting
syntax on                               

" wrapping for long lines by default
set wrap                              
" nice wrapping for long lines with respect of
" starging indent
set breakindent
" wrapping by whole words
set linebreak
" we don't need backup files (default <oldname>~)
set nobackup                              
" save temporary backup of a file on writing not in currend directory,
" but into this one
" this is useful with gulp watchers
set backupdir=/tmp//
" keep all in ram, no swapping
set noswapfile
" left/right screen scrolling when navigating
set sidescroll=5                        
" hinting for previous and next strings with symbols > or < 
set listchars+=precedes:<,extends:>     

" ignoring uppercase when searching
set ignorecase                          
" smart case compare for search
set smartcase 
" jump to matched text while typing in search mode
set incsearch                           
" highlight matched words while searching
set hlsearch

" number of spaces used for indentaion by Tab key pressing
set tabstop=4
" indentation size (in spaces) for >> and << commands in command mode
set shiftwidth=4
" automatic replacement of tabs with spaces during typing
set expandtab
" добавка отступа в строке при нажатии Tab в начале строки (до первого непробельного символа)
set smarttab
" keeping of an indent of previous line for pasted/inserted new line
set autoindent                          
" show line numbers
set number

" highlighting of pair bracket for a bracket under a cursor
set showmatch
" show unfinished commands in bottom-right side of command line 
set showcmd

" switching off of redrawing while macros execution
" set lazyredraw

" default vim encodings
set encoding=utf-8
set termencoding=utf-8

" vim default file formats and encodings for files
set fileformats=unix,dos,mac
set fileencodings=utf-8,cp1251

" TODO: translate rest of strings
" отображаем классную строку статуса по-умолчанию
set laststatus=2

" включаем удобное меню автодополнения в командной строке по Tab
set wildmenu 
" конфигурация wildmenu
set wildmode=list:longest,list:full
" игнорирование некоторых типов файлов для wildmenu
set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git

" настройка автоматического сворачивания блоков текста
set foldmethod=indent
" максимальный уроень для автоматического сворачивания
" set foldlevel=3

" автоматическое перечитываение файла вимом, если тот был изменен извне
set autoread
au BufEnter,BufWinEnter,WinEnter,FocusGained,CmdwinEnter * checktime

" обнуление задержки для клавиши Esc
set ttimeout ttimeoutlen=0 notimeout

" отображение непечатных символов спецсимволами юникода
if has('multi_byte')
    set listchars=tab:\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
    " Vertical split chars
    set fillchars=stl:\ ,stlnc:\ ,vert:│
    " Show ↪ at the beginning of wrapped lines
    if has("linebreak")
        let &sbr = '>>>>>>>> ' 
    endif
endif


"==================================
"= Common keys overrides
"==================================

" setting of comfortable (for me:) Leader key
let mapleader = "\<Space>"
" удобное сохранение файла
nnoremap <Leader>q :w!<CR>
nnoremap <Leader>й :w!<CR>
" удобная работа с окнами
nnoremap <Leader>w <C-w>
nnoremap <Leader>ц <C-w>
" увеличение отступа по Tab в командном режиме 
" nmap <Tab> >>
" уменьшение отступа по Shift-tab в командном режиме 
" nmap <S-Tab> <<
" уменьшение отступа по Shift-tab в режиме вставки
imap <S-Tab> <Esc><<i

" корректируем поведение при создани новых строк так, чтобы при выходе из
" режима редактирования сохранялся имеющийся отступ от начала строки
nnoremap o ox<BS>
nnoremap O Ox<BS>

" ESC redefinition
" imap ;; <ESC>

" решение вопроса с командным режимом в русской рацкладке
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
nmap Ж :
nmap Н Y
nmap н y
nmap З P
nmap з p
nmap ф a
nmap щ o
nmap г u
nmap З P 
imap <C-х> <C-[>
" imap жж <ESC>

" go to file under a cursor
nnoremap gf gF

" ********* NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>т :NERDTreeToggle<CR>

" ********* CtlP
" comfortable for me keys bindings for CtrlP plugin
map <leader>c :CtrlP<CR>
map <leader>v :CtrlPBuffer<CR>
map <leader>b :CtrlPBufTag<CR>

map <leader>с :CtrlP<CR>
map <leader>м :CtrlPBuffer<CR>
map <leader>и :CtrlPBufTag<CR>

" ********* Tagbar
nmap <leader>t :TagbarToggle<CR>

" ********* EasyMotion
" классное перемещение в любую точку по одному или двум символам
nmap <Leader>f <Plug>(easymotion-s)
nmap <Leader>d <Plug>(easymotion-s2)

nmap <Leader>а <Plug>(easymotion-s)
nmap <Leader>в <Plug>(easymotion-s2)
" настройка удобного перемещения по строкам
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

map <Leader>д <Plug>(easymotion-lineforward)
map <Leader>о <Plug>(easymotion-j)
map <Leader>л <Plug>(easymotion-k)
map <Leader>р <Plug>(easymotion-linebackward)


" set up convinient key bindings for command line navigation
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>
cnoremap <C-L> <Right>
cnoremap <C-H> <Left>


"==================================
"= Syntax checker settings
"==================================

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '!!'
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = '??'

" --- JS syntax checking options
let g:syntastic_javascript_checkers = ['eslint']

" --- PHP syntax checking options
let g:syntastic_php_checkers=['phpcs', 'php']
let g:syntastic_php_phpcs_exec='~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'


"==================================
"= Plugin-specific settings
"==================================

" --- Vim-airline 
" activate color theme for airline (also not bad: badwolf, durant, hybrid)
let g:airline_theme='hybrid'
" activate special symbols from airline font for airline UI
if has('win32') || has('win64')
    let g:airline_symbols = {}
    
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
else    
    let g:airline_powerline_fonts=1
endif
" Tab showing plugin
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#buffer_idx_mode=0
" git branch name visualisation (with helof of fugitive plugin)
let g:airline#extensions#branch#enabled=1

" --- Tmuxline
let g:tmuxline_preset = 'full'

" --- NerdTree

" --- IndentLine
let g:indentLine_faster=1
let g:indentLine_char="¦"
if has('win32') || has('win64')
    let g:indentLine_char="│"
endif

" --- EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" --- Startify
let g:startify_session_dir = '~/.vim/session'

" --- Ctrl-p
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|build$\|node_modules$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" --- UltiSnips
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"

" --- Vdebug 
let g:vdebug_options= {
\    "port" : 9013,
\    "server" : '',
\    "timeout" : 20,
\    "on_close" : 'detach',
\    "break_on_open" : 0,
\    "ide_key" : 'PHPSTORM',
\    "path_maps" : {},
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "continuous_mode" : 1,
\    "watch_window_style" : 'expanded',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾'
\}

" --- Tagbar

