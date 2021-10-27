if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  "И скачать его оттуда
  "А после прогнать команду PlugInstall, о которой мы сейчас поговорим
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
filetype plugin indent on " Включает определение типа файла, загрузку соответствующих ему плагинов и файлов отступов
call plug#begin('~/.vim/bundle') " Начать искать плагины в этой директории

"Тут будут описаны наши 
Plug 'preservim/nerdtree' " Nerd файловый менеджер
Plug 'ErichDonGubler/vim-sublime-monokai' " Тема monokai
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons' " Далее я про это напоминать не буду
call plug#end() 
"Перестать искать плагины

"Не в список плагинов
let g:airline_powerline_fonts = 1 " Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 " Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" " Кастомная графа положения курсора
let g:Powerline_symbols='unicode' " Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 " Про это позже расскажу

nmap <F6> :NERDTreeToggle<CR> " Запуск фм по нажатию f6
let mapleader = "," "Смена кнопки лидера

colorscheme desert " Активация темы
"syntax enable "Включает подсветку синтаксиса
syntax on " Включает подсветку синтаксиса для языков 

set number " показывать номера строк
set list " включить подсветку
set showcmd " Подсказки ввода команд

set hlsearch " Подсвечивать результаты поиска " set hls
set incsearch " Поиск в процессе набора " set is
set ignorecase " Учет регистра при поиске  "set ic
set smartcase

set laststatus=2 " всегда показывать строку состояния
set pastetoggle= " подсвечивает все слова, которые совпадают со словом под курсором.
set showmatch " показывать первую парную скобку после ввода второй
set wildmenu " Дополнительная информация в строке состояния

set encoding=utf-8 " Ставит кодировку UTF-8
set nocompatible " Отключает обратную совместимость с Vi
set ch=1 " Сделать строку команд высотой в одну строку

set t_Co=256 " использовать больше цветов в терминале

"set cursorline " Подсвечивать линию текста, на которой находится курсор
highlight CursorLine guibg=lightblue ctermbg=lightgray
highlight CursorLine term=none cterm=none


set wrap linebreak nolist " Данная вариация работает как wrap(перенос слов целиком)
set expandtab
set smarttab
set tabstop=2 " set ts=2  " Установить пробелы вместо табов
set softtabstop=4
set shiftwidth=4

"set mouse=a "включает поддержку мыши при работе в терминале (без GUI)

" <F2> сохранение сделанных изменений:
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
" <F4> открывается новая вкладка (tab) и выводится список каталогов
imap <F4> <Esc>:browse tabnew<CR> 
map <F4> <Esc>:browse tabnew<CR>
" Позволяет по <Tab>, более привычному некоторым пользователям, вызывать авто-дополнение для текущего активного синтаксиса
 function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
 endfunction
 inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
 inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
