
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Place the git link of given plugins
Plugin 'VundleVim/Vundle.vim'

" Text Completion
Plugin 'Valloric/YouCompleteMe'
" Asynchronous Lint Engine
Plugin 'w0rp/ale'
" File System Explorer
Plugin 'scrooloose/nerdtree'
" Statusline Legibility
Plugin 'itchyny/lightline.vim'
" Surroundings
Plugin 'tpope/vim-surround'
" Fade Inactive Windows
Plugin 'TaDaa/vimade'

call vundle#end()
filetype plugin indent on

" lightline Settings
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" vimaade Settings
let g:vimade = {
 \ "normalid": '',
 \ "basefg": '',
 \ "basebg": '000000',
 \ "fadelevel": 0.9,
 \ "colbufsize": 30,
 \ "rowbufsize": 30,
 \ "checkinterval": 32,
 \ "usecursorhold": 0,
 \ "detecttermcolors": 1
 \ }


