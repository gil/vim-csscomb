"=============================================================================
" File: csscomb.vim
" Author: Aleksandr Batsuev (alex@batsuev.com)
" WebPage: https://github.com/batsuev/csscomb-vim
" License: MIT

let g:CSScombPluginDir = fnamemodify(expand("<sfile>"), ":h")

function! g:CSScomb(count, line1, line2)
    let content = getline(a:line1, a:line2)

    let tempFile = tempname() . '.' . &filetype
    call writefile(content, tempFile)
    call system('csscomb ' . shellescape(tempFile))
    let lines = readfile(tempFile)

    call setline(a:line1, lines)
endfunction

command! -nargs=? -range=% CSScomb :call g:CSScomb(<count>, <line1>, <line2>, <f-args>)
