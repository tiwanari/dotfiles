"########################
"#        Editor        #
"########################

" double 'j' to go back to normal mode and save the file
inoremap <silent> jj <ESC>:<C-u>w<CR>

" Stop yanking for x and s
nnoremap x "_x
nnoremap s "_s



"########################
"#        Search        #
"########################

" redraw and disable highlighting hits
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
