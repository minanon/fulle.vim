" for lvimgrep pattern
let g:fulle_function_pattern = {
    \ 'php'        : '/\c\vfunction\s+.*\(|^\s*class\s+.*/',
    \ 'ruby'       : '/\v^\s*(def|class|module)\s/',
    \ 'vim'        : '/function!\= \+\(.*\)/',
    \ 'pascal'     : '/\c\vprocedure|function\s+.*\(/',
    \ 'javascript' : '/\c\vfunction\s*.*\(/',
    \ 'perl'       : '/\c\v^\s*sub\s+[^{]*/',
    \ 'sh'         : '/\c\v^(function)?\s*.+\(\)/',
\}

" for parse lwindow list
let g:fulle_exclude_pattern_from_list = {
    \ 'javascript' : '/\c\v.{-}\|(\d*).{-}\|.{-}(([a-zA-Z0-9\.]+)\s*[\=:])?\s*function\s*([a-zA-Z0-9\.]*)\s*(\(.{-}\)).*\{?/\1:\3\4\5/',
    \ 'perl'       : '/\c\v.*\|(\d*)\s.*\|\s*.*(sub)/\1:\2/',
    \ 'vim'        : '/\c\v.*\|(\d*)\s.*\|\s*.*function!?/\1:/',
    \ 'sh'         : '/\c\v.*\|(\d*)\s.*\|\s*(function)?/\1:/',
    \ 'ruby'       : '/\c\v.*\|(\d*)\s.*\|\s*.*(def|(class|module))/\1:\3/',
\}

" width for vertical
let g:fulle_window_width = 30

" height for horizontal
let g:fulle_window_height = 6

let s:type = ''

" Grep functions and displaies with lw
function! s:funcgrep()

    if !has_key(g:fulle_function_pattern, s:type)
        echo "unknown filetype: " . s:type
        return 0
    endif

    try
        silent exe 'lv ' . g:fulle_function_pattern[s:type] . ' % | lw'
    catch
        echo v:exception
        return 0
    endtry
    return 1
endfunction

" parse list
function! s:parselist()
    setlocal nofoldenable
    setlocal modifiable
    if has_key(g:fulle_exclude_pattern_from_list, s:type)
        let l:exclude_match = g:fulle_exclude_pattern_from_list[s:type]
    else
        let l:exclude_match = '/\c\v.*\|(\d*)\s.*\|\s*.*(function|(class)|procedure)/\1:\3/'
    endif
    silent exe '%s' . l:exclude_match
    setlocal nomodifiable
endfunction

function! s:common()
    let s:type = &filetype

    " current line
    let l:cr_line = line('.')

    " toggle lwindow
    let _ = winnr('$')
    lclose
    if _ != winnr('$')
        return 1
    endif

    " lvimgrep
    if s:funcgrep() != 1
        return 0
    endif

    " parse list
    call s:parselist()

    " go back to current line
    wincmd p
    silent exe l:cr_line
    wincmd p

    " settings
    setlocal syntax=off
    syntax match fontcolorclass "class" display containedin=ALL
    highlight fontcolorclass term=underline ctermfg=DarkGreen

    setlocal nomodified

    " to top on list
    1
endfunction

function! fulle#listup()
    call fulle#listup_vertical()
endfunction

function! fulle#listup_vertical()

    call s:common()

    " to left
    wincmd L
    silent exe 'vertical resize ' . g:fulle_window_width

endfunction

function! fulle#listup_horizontal()

    call s:common()

    silent exe 'resize ' . g:fulle_window_height

endfunction
