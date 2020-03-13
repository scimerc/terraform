set autoindent
set backspace=indent,eol,start
set binary
set expandtab
set list listchars=tab:»\ ,eol:$
set noeol
set nowrap
set number
set ruler
set shiftwidth=2
set softtabstop=2
set tabstop=2
set tabpagemax=100
highlight Comment cterm=italic ctermfg=LightBlue ctermbg=NONE
highlight Cursor cterm=NONE ctermfg=Grey ctermbg=NONE
highlight LineNr cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=LightGray guibg=NONE
highlight NonText cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=LightGray guibg=NONE
" define comment functions
" lhs comments
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,% :s/^/%/<CR>:nohlsearch<CR>
map ,! :s/^/!/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>
map ,- :s/^/--/<CR>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" yank deleted text to the blackhole register when pasting over visual selection
vnoremap p "_dP

function! ExclamationComment()
  map - :s/^/! /<CR>:nohlsearch<CR>
  map _ :s/^\s*! \=//<CR>:nohlsearch<CR>
endfunction

function! PercentComment()
  map - :s/^/% /<CR>:nohlsearch<CR>
  map _ :s/^\s*% \=//<CR>:nohlsearch<CR>
endfunction

function! PoundComment()
  map - :s/^/# /<CR>:nohlsearch<CR>
  map _ :s/^\s*# \=//<CR>:nohlsearch<CR>
  set comments=:#
endfunction

function! QuoteComment()
  map - :s/^/\" /<CR>:nohlsearch<CR>
  map _ :s/^\s*\" \=//<CR>:nohlsearch<CR>
endfunction

function! SlashComment()
  map - :s/^/\/\/ /<CR>:nohlsearch<CR>
  map _ :s/^\s*\/\/ \=//<CR>:nohlsearch<CR>
endfunction

" and then later...
autocmd FileType bash call PoundComment()
autocmd FileType cgi call PoundComment()
autocmd FileType csh call PoundComment()
autocmd FileType java call SlashComment()
autocmd FileType matlab call PercentComment()
autocmd FileType perl call PoundComment()
autocmd FileType r call PoundComment()
autocmd FileType sh call PoundComment()
autocmd FileType tex call PercentComment()
autocmd FileType vim call QuoteComment()

