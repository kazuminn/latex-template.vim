"vimのテンプレートを読み込み、引数を反映させます。
"Version: 1.0
"Author: kazuminn
"License: VIM LICENSE

if exists('g:loaded_latex_template')
        finish
endif
let g:loaded_latex_template = 1 

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=* LatexTemplate :call MakeTemplate(<f-args>)

function! MakeTemplate(...)
        r ~/latex_template.tex
        let ena = 3 
        let n = 0 
"        if n < ena 
 "               execute '%s/'"arg".n.'/\=a:000[n]/'
"               let n += 1
       " endif
        for _ in a:000
        ¦       silent! %s/arg\([0-9]\+\)/\=get(a:000, submatch(1)-1, '')/g
        ¦       let n += 1
        endfor
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
