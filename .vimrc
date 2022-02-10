set termguicolors
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:godef_split=3 
let g:godef_same_file_in_same_window=1 
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
set autowrite
colorscheme gotham
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nnoremap <buffer> <C-]> :call GodefUnderCursor()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
let g:go_fmt_command = "goimports"

function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

set nu 
set cursorline 
set showmatch 

set tabstop=4 
set shiftwidth=4 
set autoindent 
