" ====================================================================
" Arquivo: vim-short-cpp.vim
" Autor: Bruno Franco
" Ultima_modificacao: 27-04-2021
" Download: git@github.com:brnfra
" Licence:Este arquivo é de domínio público
" Garantia: O autor não se responsabiliza por eventuais danos
"             causados pelo uso deste arquivo.
"
"      (_)                   | |              | |                         
"__   ___ _ __ ___ ______ ___| |__   ___  _ __| |_ ______ ___ _ __  _ __  
"\ \ / / | '_ ` _ \______/ __| '_ \ / _ \| '__| __|______/ __| '_ \| '_ \ 
" \ V /| | | | | | |     \__ \ | | | (_) | |  | |_      | (__| |_) | |_) |
"  \_/ |_|_| |_| |_|     |___/_| |_|\___/|_|   \__|      \___| .__/| .__/ 
"                                                            | |   | |    
"                                                            |_|   |_|    
""     
"
"-------------------------------------------------------
" map by Luke Smith
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
let maplocalleader = ","
"                       -- C --      {{{
"-------------------------------------------------------
"Head and body frequent tags
autocmd Filetype c,h,o setlocal ts=4 sw=4 
"-- preprocessor a once
"autocmd FileType c,h,o inoremap #io #include <stdio.h><Enter>
"autocmd FileType c,h,o inoremap #lib #include <stdlib.h><Enter>
autocmd FileType c,h,o inoremap #mat #include <math.h><Enter>
autocmd FileType c,h,o inoremap #def #define 

" basics libraries
autocmd FileType c,h,o inoremap main #include <stdio.h><Enter>
            \#include <stdlib.h><Enter><Enter>
            \/*     Constants       */<Enter>
            \#define EXIT_SUCCESS 0<Enter>
            \<Enter>
            \int main(void) {<Enter>
            \<Enter>
            \/*     Your Program Here!      */<Enter>
            \<++><Enter>
            \return EXIT_SUCCESS;<Enter>
            \}

"--  tags 
autocmd FileType c,h,o inoremap prt printf("<++>",<++>); 
autocmd FileType c,h,o inoremap put puts("<++>");
autocmd FileType c,h,o inoremap sca scanf("<++>",&<++>);
"autocmd FileType c,h,o inoremap struct #include <stdio.h><Enter>
"autocmd FileType c,h,o inoremap paterns #include <stdio.h><Enter>

""-------------------compiling & Run
if !exists("g:gcc")
    let g:c_command = "gcc"
endif

function! CCompileAndBuildFile()
    silent !clear
   " %:t receive file name in the tail of path %:r remove extension
    execute "!" . g:c_command . " " .expand("%:t"). " " . "-o" . " " .expand("%:r")
endfunction

function! CRunFile()
    silent !clear
   "" execute "!" . g:c_command . " " . bufname("%")
    execute "!" . "\.\/" .expand("%:r")
endfunction

nnoremap <buffer> <localleader>b :call CCompileAndBuildFile()<cr>
nnoremap <buffer> <localleader>r :call CRunFile()<cr>
""-------------------Specials
" make files
"------------------------------------------}}}
"-------------------------------------------------------

