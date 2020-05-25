set autoread
set autoindent
set backspace=indent,eol,start
set binary
set expandtab
set list listchars=tab:»\ ,eol:$
" set mouse=a
set noeol
set nowrap
set number
set ruler
set runtimepath^=~/.vim/bundle/tabulous
set shiftwidth=2
set softtabstop=2
set tabstop=2
set tabpagemax=100
highlight Comment ctermfg=DarkBlue ctermbg=NONE
highlight Cursor cterm=NONE ctermfg=Grey ctermbg=NONE
highlight LineNr gui=NONE guifg=LightGray guibg=NONE
highlight NonText gui=NONE guifg=LightGray guibg=NONE
highlight Normal gui=NONE guifg=DarkGray guibg=NONE
if !has( 'gui_running' )
"     highlight DiffAdd cterm=NONE ctermbg=LightBlue
"     highlight DiffDelete cterm=NONE ctermbg=LightBlue
    highlight DiffChange cterm=NONE ctermbg=DarkBlue
    highlight LineNr cterm=NONE ctermbg=NONE ctermfg=DarkGrey
    highlight NonText cterm=NONE ctermbg=NONE ctermfg=DarkGrey
    highlight Normal cterm=NONE ctermbg=NONE ctermfg=LightGrey
    highlight TabLineFill cterm=NONE ctermbg=Black
    highlight TabLineSel cterm=bold ctermbg=NONE ctermfg=Gray
    highlight TabLine cterm=bold ctermbg=NONE ctermfg=DarkGray
    highlight Visual cterm=NONE ctermbg=White
endif
vnoremap p "_dP
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


