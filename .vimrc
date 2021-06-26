if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  "И скачать его оттуда
  "А после прогнать команду PlugInstall, о которой мы сейчас поговорим
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
"Тут будут описаны наши плагины
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons' "Далее я про это напоминать не буду
call plug#end() "Перестать это делать

"Не в список плагинов
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу



filetype plugin indent on "Включает определение типа файла, загрузку соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
set ch=1 "Сделать строку команд высотой в одну строку
" syntax enable "Включает подсветку синтаксиса

set cursorline " Подсвечивать линию текста, на которой находится курсор
highlight CursorLine guibg=lightblue ctermbg=lightgray
highlight CursorLine term=none cterm=none

set wildmenu "Дополнительная информация в строке состояния

set incsearch " Поиск в процессе набора$
set wrap linebreak nolist "Данная вариация работает как wrap
colorscheme sublimemonokai
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number "показывать номера строк
"set mouse=a "включает поддержку мыши при работе в терминале (без GUI)
syntax on "Включает подсветку синтаксиса
set t_Co=256 " использовать больше цветов в терминале
set list " включить подсветку
set showcmd
set laststatus=2 " всегда показывать строку состояния
set pastetoggle= " подсвечивает все слова, которые совпадают со словом под курсором.
set showmatch " показывать первую парную скобку после ввода второй
