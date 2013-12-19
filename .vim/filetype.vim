if exists("did\_load\_filetype")
    finish
endif

augroup markdown
    au! BufRead,BufNewFile  *.mkd    setfiletype mkd
augroup END

augroup breeze
    au! BufRead,BufNewFile *.br     setfiletype breeze
augroup END
