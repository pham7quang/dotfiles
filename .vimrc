" -----vimrc no longer used, replaced with nvim-------
set runtimepath+=~/.vim_runtime
set number
:imap ii <Esc>


source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme onedark
autocmd BufEnter * colorscheme onedark
map <F2> :NERDTreeToggle<CR>
let g:gitgutter_enabled = 1

" set tabs to be 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" tagbar setup
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

set tags=./tags,tags;/

map <F8> :TagbarToggle<CR>

" CtrlP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" https://github.com/dkprice/vim-easygrep/blob/master/doc/EasyGrep.txt
" EasyGrep
set grepprg=grep\ -nH 
let g:EasyGrepCommand=1
" searchs using the current file's extension
let g:GrepProgram=2
let g:EasyGrepMode=0
let g:EasyGrepWindow=1
" let g:EasyGrepOpenWindowOnMatch=0
let g:EasyGrepRoot = "repository"
let g:EasyGrepFilesToExclude=".svn,.git,.js,*.swp,*~,node_modules,*.d.ts,.*.ts.html,dist,coverage"
let g:EasyGrepRecursive=1
