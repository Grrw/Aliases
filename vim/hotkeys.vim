
" Hotkeys
map <C-o> :NERDTreeToggle<CR>
map <C-l> :vsplit<CR>
map <C-j> :split<CR>
map <C-a> :setlocal spell spelllang=en_us<CR> 

" Automatic Closers (Honestly...)
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Closer Skipper
inoremap ) <del>)
inoremap ] <del>]
inoremap } <del>}<CR>
" inoremap > <del>>
inoremap }<CR> <del><del>}<CR>
inoremap };<CR> <del><del><del>};<esc>o

