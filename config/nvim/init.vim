set relativenumber
set scrolloff=5

" theme
packadd! dracula
syntax enable
set termguicolors
colorscheme dracula

" quickfix shortcuts
nnoremap <leader>o :copen<CR>
nnoremap <leader>q :cclose<CR>
map <C-n> :cnext<CR>
map <C-p> :cprev<CR>

" build shortcuts
nmap <leader>b :make<CR>

" unmap K
map <S-k> <Nop>

" per-language indent and wrapping
autocmd FileType markdown set tw=80
autocmd FileType yaml set ts=2 sts=2 sw=2 et
autocmd FileType proto set ts=2 sts=2 sw=2 et tw=80 si
autocmd FileType hcl set ft=terraform

" go settings
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>a <Plug>(go-alternate-edit)
autocmd FileType go nmap <leader>a <Plug>(go-alternate-edit)

let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_metalinter_autosave = 1
let g:go_gopls_gofumpt = 1
