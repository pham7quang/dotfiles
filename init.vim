" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 

" Plugins will be downloaded under the specified directory. default to './plugged/'
call plug#begin()
" Declare the list of plugins.
Plug 'neoclide/coc.nvim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" easy git commands
Plug 'tpope/vim-fugitive'
" commands to copy and paste via clipboard
Plug 'christoomey/vim-system-copy'
" auto close quotes brackets
Plug 'raimondi/delimitmate'
" auto close html tags
Plug 'alvan/vim-closetag'
" used for indexing so we can find objects/functions/declarations easier
Plug 'universal-ctags/ctags'
" python formatting - NOTE: needs to run `pip3 install neovim --user` as user
" also `pip3 install black` needs to be installed
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' }

" use :Ack to grep files using ag (instead of ack) in VIM
Plug 'mileszs/ack.vim'
" auto format the code as you save
Plug 'chiel92/vim-autoformat'

" using "w" to navigate with camalcase, snakecase, terms
Plug 'bkad/CamelCaseMotion'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"  General
let mapleader = ","
let g:mapleader = ","
" use tabs instead of spaces
set tabstop=2 shiftwidth=2 expandtab

" quick save
nmap <leader>w :w!<cr>

"""""" shortcuts
" exit insert mode
:imap ii <Esc>

" map <space> with search
map <space> /

" search without case sensitivity
set ignorecase

""""""""""""""" Plugin Settings """"""""""""""""""
" NERDTREE"
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"


"""""""" onedark to work with nvim and tmux """""""
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
""""""""" END one dark """""""""""""""""

" gitgutter on and update it ever 100ms
set number
set updatetime=100
let g:gitgutter_enabled = 1

" vim-closetag settings of which files to enable the autoclosing on
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

""""""""" coc.vim """"""""""""
" coc.vim options to use tabs to select suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" extensions
let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-tsserver', 'coc-python']

"""""""" END coco.vim """""""""""

" get Ack to use The Silver Searcher instead of Ack (which follows .gitignore
" and better for code searching
" if this doesn't work, install The Silver Search: brew install the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlp - ignore folders
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'


" do not support python 2 provider, for black to work
let g:loaded_python_provider = 0
let g:python_host_prog = ''

" CamelCaseMotion leading character
let g:camelcasemotion_key = '<'
