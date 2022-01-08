"        ___        ___          /__/\    
"       /__/\      /  /\        |  |::\   
"       \  \:\    /  /:/        |  |:|:\  
"        \  \:\  /__/::\      __|__|:|\:\ 
"    ___  \__\:\ \__\/\:\__  /__/::::| \:\
"   /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
"   \  \:\|  |:|     \__\::/  \  \:\      
"    \  \:\__|:|     /__/:/    \  \:\     
"     \__\::::/      \__\/      \  \:\    
"         ~~~~                   \__\/    


set mouse=a
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set encoding=utf-8
set incsearch
set hlsearch
set ignorecase
set smartcase
set number
highlight LineNr ctermfg=white
set t_Co=256
set viminfo='100,<9999,s100

"" Set status line display
set laststatus=2
hi StatusLine ctermfg=NONE ctermbg=red cterm=NONE
hi StatusLineNC ctermfg=black ctermbg=red cterm=NONE
hi User1 ctermfg=black ctermbg=magenta
hi User2 ctermfg=NONE ctermbg=NONE
hi User3 ctermfg=black ctermbg=blue
hi User4 ctermfg=black ctermbg=cyan
set statusline=\                    " Padding
set statusline+=%f                  " Path to the file
set statusline+=\ %1*\              " Padding & switch colour
set statusline+=%y                  " File type
set statusline+=\ %2*\              " Padding & switch colour
set statusline+=%=                  " Switch to right-side
set statusline+=\ %3*\              " Padding & switch colour
set statusline+=line                " of Text
set statusline+=\                   " Padding
set statusline+=%l                  " Current line
set statusline+=\ %4*\              " Padding & switch colour
set statusline+=of                  " of Text
set statusline+=\                   " Padding
set statusline+=%L                  " Total line
set statusline+=\                   " Padding

"" Mappings


map <C-s> :w<CR>
map ss :mks! ~/.vim/sessions/
map sh :sp
map sv :vsp
map dt :DimInactiveToggle<CR>
map dc :hi ColorColumn ctermbg=
map cs :colorscheme<space>
map ct :ColorToggle<CR>
map <C-t> :tabnew<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-u> :UndotreeToggle<CR>
map <C-g> :Goyo<CR>

" Paste system clipboard with Ctrl + v
inoremap <C-v> <ESC>"+gPi    
nnoremap <C-v> "+gP<ESC>
vnoremap <C-v> d"+gP<ESC>
cnoremap <C-v> <C-r>+

" Cut to system clipboard with Ctrl + x
vnoremap <C-x> "+d
nnoremap <C-x> "+dd
inoremap <C-x> <ESC>"+ddi

" Copy to system clipboard with Ctr + c
vnoremap <C-c> "+y 
nnoremap <C-c> "+yy 
inoremap <C-c> <ESC>"+yyi

map <C-space> :map <space> <Nop>
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <silent> <space><cr> :noh<CR>
nnoremap fr :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>
nnoremap <silent> <Tab> :tabnext<CR>

""Plug-ins
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-python/python-syntax'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
"Plug 'blueyed/vim-diminactive'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-pencil'
Plug 'lilydjwg/colorizer'
Plug 'arzg/vim-colors-xcode'
call plug#end()

""Plug Config
"autocmd VimEnter * NERDTree
":hi ColorColumn ctermbg=8
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:colorizer_maxlines=1000
let g:colorizer_startup = 0
let g:lens#width_resize_min = 50

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
