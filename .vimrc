scriptencoding utf-8

set nocompatible              " be iMproved, required
filetype off                  " required set exrc
set secure

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' "required
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'lervag/vimtex'
Plugin 'chrisbra/Colorizer'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'udalov/kotlin-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------------------------------------------------
"                        extensions conf
"--------------------------------------------------------------------

" YCM conf
let g:ycm_global_ycm_extra_conf = '/home/nik/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_always_populate_location_list = 1


" NerdTree conf
let g:netrw_banner=0
map <C-n> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=50


" airline conf
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline_theme='onedark'

"--------------------------------------------------------------------
"                        regular vim conf
"--------------------------------------------------------------------
syntax on
let g:load_doxygen_syntax=1
" show whitespaces
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
nnoremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

let mapleader=" "
set noerrorbells
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
set number
" tab conf
set tabstop=4 shiftwidth=4
set expandtab

noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>gd :ALEGoToDefinition<CR>

" clang-format integration
map <C-K> :py3f /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/share/vim/addons/syntax/clang-format.py<cr>

"--------------------------------------------------------------------
"                        GVim conf
"--------------------------------------------------------------------

" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
" YCM little '>>' on the line number
hi Error term=reverse ctermfg=251 ctermbg=088
" YCM higlightet text on '>>' line
hi SpellBad term=reverse ctermfg=251 ctermbg=088
" Readable selection
hi Visual term=reverse ctermfg=016
" Popup menu
hi Pmenu term=reverse ctermfg=251 ctermbg=236
" fold colors
hi Folded ctermbg=black
