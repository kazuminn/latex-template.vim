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

command! -nargs=* LatexTemplate :call s:MakeTemplate(<f-args>)

function! s:MakeTemplate(...)
        r ~/latex_template.tex
                silent! %s/arg\([0-9]\+\)/\=get(a:000, submatch(1)-1, '')/g
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
