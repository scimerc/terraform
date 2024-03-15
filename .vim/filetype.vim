" my filetype file
if exists ( "did_load_filetypes" )
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile Dockerfile* setfiletype dockerfile
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile Makefile* setfiletype make
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile *.R,*.Rhistory*,*.Rscript setfiletype r
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile *.m setfiletype matlab
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile *.perl setfiletype perl
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile *.py setfiletype python
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile *.sql setfiletype sql
augroup END
augroup filetypedetect
    au! BufRead,BufNewFile *.tex setfiletype tex
augroup END

