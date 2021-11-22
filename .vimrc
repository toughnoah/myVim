set termguicolors
set background=dark 
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:godef_split=3 
let g:godef_same_file_in_same_window=1 
set autowrite
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

let mapleader=";"

vmap <Leader>c "+yy
nmap <Leader>c "+yy
nmap <Leader>v "+p

set incsearch
set ignorecase
syntax enable
syntax on                   
filetype plugin indent on    

au InsertLeave *.go,*.sh,*.php write
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'dgryski/vim-godef'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'acarapetis/vim-colors-github'
Plug 'rakr/vim-one'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/desertEx'
Plug 'Shougo/neocomplete.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi'

call plug#end()
set mouse=a

if has("persistent_undo")
   let target_path = expand('~/.undodir')
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

nnoremap <F7> :UndotreeToggle<CR>

nmap <silent> <F5> <Plug>MarkdownPreview        
imap <silent> <F5> <Plug>MarkdownPreview        
nmap <silent> <F6> <Plug>StopMarkdownPreview   
imap <silent> <F6> <Plug>StopMarkdownPreview  

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <leader>n :NERDTreeFocus<CR>
nmap <F3> :NERDTreeToggle  <CR>
nmap nf :NERDTreeFind<CR>


nmap <F8> :TagbarToggle<CR>

nnoremap <Leader>fi :YcmCompleter FixIt<CR>
nnoremap gi :YcmCompleter GoTo<CR>
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gh :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>


nnoremap ff <C-W>w
nnoremap fk <C-W>W
nnoremap fh <C-W>h
nnoremap fl <C-W>l
nnoremap <Tab>h gT
nnoremap <Tab>l gt
set foldmethod=indent
set nofoldenable

set spelllang=en_us

if !has('gui_running')
  let g:NERDMenuMode = 0
endif

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
