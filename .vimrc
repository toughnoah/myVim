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

let mapleader=";"

vmap <Leader>c "+yy
nmap <Leader>c "+yy
nmap <Leader>v "+p

set incsearch
set ignorecase
syntax enable
syntax on                   
filetype plugin indent on    

au InsertLeave *.go,*.sh write
call plug#begin('~/.vim/plugged')
Plug 'buoto/gotests-vim'
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
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'KeitaNakamura/neodark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'acarapetis/vim-colors-github'
Plug 'rakr/vim-one'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/desertEx'
Plug 'mbbill/echofunc'
Plug 'Shougo/neocomplete.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ludovicchabant/vim-gutentags'
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


tnoremap <Esc><Esc> <C-\><C-N>

tnoremap <C-V><Esc> <Esc>

set completeopt=longest,menuone

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_auto_hover = ''
let g:ycm_complete_in_comments = 1
let g:ycm_filetype_whitelist = {
	  \ 'c': 1,
	  \ 'cpp': 1,
	  \ 'python': 1,
	  \ 'vim': 1,
	  \ 'go': 1,
	  \ 'sh': 1,
	  \ 'zsh': 1,
	  \ }
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_key_list_stop_completion = ['<CR>']

nmap <Leader>o o<Esc>


if has('vcon')
  set termguicolors
endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['go'] = s:blue
let g:NERDTreeExtensionHighlightColor['yaml'] = s:brown
let g:NERDTreeExtensionHighlightColor['py'] = s:salmon

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" for C

let g:c_space_errors = 1
let g:c_gnu = 1
let g:c_no_cformat = 1
let g:c_no_curly_error = 1
if exists('g:c_comment_strings')
  unlet g:c_comment_strings
endif


set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
let g:clang_library_path = '/homebrew/Cellar/llvm/13.0.0_2/lib/libclang.dylib'
noremap <silent> <Tab>  :pyxf /homebrew/Cellar/llvm/13.0.0_2/share/clang/clang-format.py<CR>


function! IsGitRepo()
  " This function requires GitPython
  if has('pythonx')
pythonx << EOF
try:
    import git
except ImportError:
    pass
import vim

def is_git_repo():
    try:
        _ = git.Repo('.', search_parent_directories=True).git_dir
        return 1
    except:
        return 0
EOF
    return pyxeval('is_git_repo()')
  else
    return 0
  endif
endfunction

let g:pymode_rope = IsGitRepo()
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_string_format = 0
let g:pymode_syntax_string_templates = 0

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:ale_linters = {
      \'python': ['pylint'],
      \}
set tags+=tags
set autochdir
