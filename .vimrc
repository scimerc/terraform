set autoread
set autoindent
set backspace=indent,eol,start
set belloff=all
set binary
set expandtab
set hlsearch
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
highlight Cursor cterm=NONE ctermfg=Gray ctermbg=NONE
highlight LineNr gui=NONE guifg=LightGray guibg=NONE
highlight NonText gui=NONE guifg=LightGray guibg=NONE
highlight Normal gui=NONE guifg=DarkGray guibg=NONE
if !has( 'gui_running' )
    highlight DiffAdd cterm=NONE ctermbg=DarkGreen ctermfg=Black
    highlight DiffDelete cterm=NONE ctermbg=DarkRed ctermfg=Black
    highlight DiffChange cterm=NONE ctermbg=DarkBlue
    highlight DiffText cterm=NONE ctermbg=Blue ctermfg=DarkGray
    highlight LineNr cterm=NONE ctermbg=NONE ctermfg=DarkGray
    highlight NonText cterm=NONE ctermbg=NONE ctermfg=DarkGray
    highlight Normal cterm=NONE ctermbg=NONE ctermfg=LightGray
    highlight TabLineFill cterm=NONE ctermbg=Black
    highlight TabLineSel cterm=bold ctermbg=NONE ctermfg=Gray
    highlight TabLine cterm=bold ctermbg=NONE ctermfg=DarkGray
    highlight Visual ctermbg=DarkGray
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
autocmd FileType dockerfile call PoundComment()
autocmd FileType java call SlashComment()
autocmd FileType make call PoundComment()
autocmd FileType matlab call PercentComment()
autocmd FileType perl call PoundComment()
autocmd FileType python call PoundComment()
autocmd FileType r call PoundComment()
autocmd FileType sh call PoundComment()
autocmd FileType tex call PercentComment()
autocmd FileType vim call QuoteComment()

