"==================================
"= Менеджер плагинов Vundle 
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

" добавлять новые плагины здесь 
" ---------->
" удобный просмотрщик файлов
Plugin 'scrooloose/nerdtree'
" очень удобная строка статуса и табов
Plugin 'bling/vim-airline'
" строка статуса tmux аналогичная airline
Plugin 'edkolev/tmuxline.vim'
" отличный ускоритель написания html и css
Plugin 'mattn/emmet-vim'
" удобная работа с git
Plugin 'tpope/vim-fugitive'
" получение событий о переходе фокуса ввода в окно vim для
" автообновления файла, если он был изменен извне
Plugin 'tmux-plugins/vim-tmux-focus-events'
" крайне удобное перемещение по тексту
Plugin 'Lokaltog/vim-easymotion'
" нечеткий поиск по файлам, буферам, тегам, недавним файлам
Plugin 'kien/ctrlp.vim'
" удобное комментирование/раскомментирование текста
Plugin 'tomtom/tcomment_vim'
" удобное отображение отступов
Plugin 'Yggdroot/indentLine'
" отступы для html и js
Plugin 'lukaszb/vim-web-indent'
" удобный плагин для открытия недавних файлов, работы с сессиями
Plugin 'mhinz/vim-startify'
" удобный плагин для автоматического дополнения парных скобок, кавычек и т.п.
Plugin 'raimondi/delimitmate'
" удобный плагин для окружения слов/строк скобками, кавычками, тегами, их
" замены на другие или удаления уже имеющихся вокруг слова
Plugin 'tpope/vim-surround'
" Подсветка и отступы для stylus файлов
Plugin 'wavded/vim-stylus'
" Подсветка и отступы для less и scss файлов
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
" Подсветка синтаксиса для jade
Plugin 'digitaltoad/vim-jade'
" <---------

" All of your Plugins must be added before the following line
call vundle#end()            
filetype plugin indent on   


"==================================
"= Цветовая тема и цвета
"==================================

syntax enable
set background=dark
colorscheme molokai 
let g:rehash256 = 1


"==================================
"= Графический интерфейс
"==================================

if has('gui_running') 
     set guioptions=gc 
     
    if has('win32') || has('win64')
        " Задаем шрифт консоли
        set guifont=Consolas\ for\ Powerline\ FixedD:h11:cRUSSIAN
        " Отображение кириллицы во внутренних сообщениях программы
        lan mes ru_RU.UTF-8
        " решаем проблему с работоспособностью backspace
        set backspace=indent,eol,start
        " отключаем мышь в windows
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
"= Общее поведение vim
"==================================

" включить подсветку синтаксиса.
syntax on                               
" перенос длинных строк по-умолчанию
set wrap                              
" использовать режим красивого переноса длинных строк, часть длинной строки
" выводится с учетом отступа этой строки
set breakindent
" переносить по словам, не разрывая их в произвольных местах
set linebreak
" не создавать .bak файлы (по умолчанию <oldname>~)
set nobackup                              
" не использовать своп-файлы (все держать в памяти)
set noswapfile
" прокрутка вправо/влево когда строка заежает за край и вы по ней ползаете
set sidescroll=5                        
" показывать символы > или < если есть, что слева/справа строки
set listchars+=precedes:<,extends:>     

" игнорировать прописные/строчные при поиске
set ignorecase                          
" умное сравнивание с учетом регистра букв при поиске
set smartcase 
" при поиске перескакивать на найденный текст в процессе набора строки
set incsearch                           
" включаем подсветку при поиске
set hlsearch

" кол-во пробелов, которым символ табуляции отображается в тексте
set tabstop=4
" настройка ширины отступов при использовании >> и <<
set shiftwidth=4
" включение замены при вводе табуляций на пробелы
set expandtab
" добавка отступа в строке при нажатии Tab в начале строки (до первого непробельного символа)
set smarttab
" при добавлении новой строки, копирует отступ предыдущей строки 
set autoindent                          
" отображаение нумерации строк
set number

" подсветка парной скобки при нахождении курсора над скобкой
set showmatch
" отображение незавершенных вводимых команд в строке статуса
set showcmd

" отключение перерисовки при выполнении макросов, повышает производительность
set lazyredraw

" настройка кодировок vim по-умолчанию
set encoding=utf-8
set termencoding=utf-8

" Настройки кодировки и формата файлов
set fileformats=unix,dos,mac
set fileencodings=utf-8,cp1251

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
        let &sbr = '>>> ' 
    endif
endif

"==================================
"= Общие переназначения клавиш 
"==================================

" установка удобного Leader
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

" замена клавиши esc
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

" переход к файлу под курсором
nnoremap gf gF

" ********* NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>т :NERDTreeToggle<CR>

" ********* CtlP
" удобное управление для CtrlP
map <leader>c :CtrlP<CR>
map <leader>v :CtrlPBuffer<CR>
map <leader>b :CtrlPBufTag<CR>

map <leader>с :CtrlP<CR>
map <leader>м :CtrlPBuffer<CR>
map <leader>и :CtrlPBufTag<CR>

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


"==================================
"= Настройки для плагинов 
"==================================

" *** Vim-airline 
" выбираем цветовую тему (badwolf, durant, hybrid)
let g:airline_theme='hybrid'
" включаем использование символов из спец шрифтов для airline
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
" расширение для отображения табов
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#buffer_idx_mode=0
" расширение для отображения веток git (использует плагин fugitive)
let g:airline#extensions#branch#enabled=1

" *** Tmuxline
let g:tmuxline_preset = 'full'

" *** NerdTree

" *** IndentLine
let g:indentLine_faster=1
let g:indentLine_char="¦"
if has('win32') || has('win64')
    let g:indentLine_char="│"
endif

" *** EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" *** Startify
let g:startify_session_dir = '~/.vim/session'

" *** Ctrl-p
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|build$\|node_modules$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
