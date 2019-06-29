
"" -- user define --
let mapleader=","


"" ------------------- 常规配置 ------------------- 
set go-=r
set go-=L
set relativenumber
set cursorline
set hlsearch
set shortmess=atI
set nocompatible
set confirm
set history=600
set clipboard+=unnamed
set noerrorbells
set scrolloff=5
syntax enable
set laststatus=0

" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"" ------------------- 文件相关 ------------------- 
" 编码
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,gb2312,gb18030,cp936,usc-bom,euc-jp

" 文件类型
filetype on
filetype plugin on
filetype indent on


set nobackup
setlocal noswapfile
set bufhidden=hide
set wildmenu
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)


" 窗口分割
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a

set foldlevel=2
set foldmethod=syntax

set completeopt=noinsert,menuone,noselect
set noshowmode

"highlight Pmenu guibg=darkgrey guifg=black
"highlight PmenuSel guibg=lightgrey guifg=black

" 设定鼠标功能
set mousehide
set mousemodel=extend


"" ------------------- 搜索相关 ------------------- 
set showmatch
set ignorecase
set matchtime=1
set incsearch

"" ------------------- 缩进相关 ------------------- 
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set smarttab
set completeopt=menuone 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"修改<leader>的映射键为','






"   + ----------------------------------------- +
"   |                                           |
"   |                插件配置                   |
"   |                                           |
"   + ----------------------------------------- +
call plug#begin('~/.config/nvim/plugged')

" ui
Plug 'google/vim-colorscheme-primary'
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" syntax
Plug 'cespare/vim-toml'

" auto complete
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
Plug 'eagletmt/neco-ghc'
Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'zchee/deoplete-clang'
Plug 'neomake/neomake'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" tools
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deol.nvim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' } " not ok yet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'chemzqm/vim-easygit'
Plug 'chemzqm/denite-git'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'ncm2/float-preview.nvim'

call plug#end()


" float preview
let g:float_preview#docked=0


""""""""""""""""""""""""""""""""""""""""""""""
"                 Deoplete                   "
""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case            = 1
let g:deoplete#enable_camel_case            = 1
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#max_list                     = 8
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#option('ignore_sources', {'_': ['buffer']})
set shortmess+=c

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header  = '/Library/Developer/CommandLineTools/usr/lib/clang'

" to make xolox/lua-ftplugin work
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

call deoplete#custom#var('omni', 'functions', {
    \ 'lua': 'xolox#lua#omnifunc',
    \ })
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'lua': '\w+|\w+[.:]\w*',
    \ })


""""""""""""""""""""""""""""""""""""""""""
"                 Defx                   "
""""""""""""""""""""""""""""""""""""""""""
call defx#custom#column('icon', {
	    \ 'directory_icon': '▸',
	    \ 'opened_icon': '▾',
	    \ 'root_icon': ' ',
	    \ })

call defx#custom#option('_', {
        \ 'resume': v:true,
        \ 'toggle': v:true,
        \ 'split': 'vertical',
        \ 'direction': 'topleft',
        \ 'winwidth': 25,
        \ })

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> c     defx#do_action('copy')
  nnoremap <silent><buffer><expr> m     defx#do_action('move')
  nnoremap <silent><buffer><expr> p     defx#do_action('paste')
  nnoremap <silent><buffer><expr> l     defx#do_action('drop')
  nnoremap <silent><buffer><expr> E     defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N     defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M     defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> S     defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d     defx#do_action('remove')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> !     defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;     defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> *     defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k     line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd    defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> <Space>  defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> C     defx#do_action('toggle_columns',
                                        \ 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> <C-h> <C-w>h

  nnoremap <silent><buffer><expr> <CR>  
    \ defx#is_directory() ?
    \ defx#do_action('open_or_close_tree') :
	\ defx#do_action('multi', ['drop', 'quit'])

  nnoremap <silent><buffer><expr> o
    \ defx#is_directory() ?
    \ defx#do_action('open_or_close_tree') :
    \ defx#do_action('drop')
endfunction

"au BufEnter defx if (winnr("$") == 1) | call defx#do_action('quit') | endif 
au BufEnter defx if winnr('$') == 1 | q | endif 

"""""""""""""""""""""""""""""""""""""
"                 denite            "
"""""""""""""""""""""""""""""""""""""
call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'split': 'floating',
        \ 'winrow': &lines,
        \ 'wincol': 0,
        \ 'winwidth': winwidth(0),
        \ 'auto_resize': v:true,
        \ })
" Define mappings
"
"
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  call deoplete#custom#buffer_option('auto_complete', v:false)
  imap <silent><buffer> <ESC> <Plug>(denite_filter_quit)
  imap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
endfunction

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>  denite#do_map('do_action')
  nnoremap <silent><buffer><expr> o     denite#do_map('do_action', 'open')
  nnoremap <silent><buffer><expr> a     denite#do_map('do_action', 'add')
  nnoremap <silent><buffer><expr> d     denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> r     denite#do_map('do_action', 'reset')
  nnoremap <silent><buffer><expr> c     denite#do_map('do_action', 'Commit')
  nnoremap <silent><buffer><expr> p     denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q     denite#do_map('quit')
  nnoremap <silent><buffer><expr> i     denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Change matchers.
call denite#custom#source(
	\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
" Change sorters.
call denite#custom#source(
	\ 'file/rec', 'sorters', ['sorter/sublime'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
            \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',['scantree.py'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


" denite key
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
nnoremap <silent> <C-p> :<C-u>Denite
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
nnoremap <silent> <leader>p :<C-u>Denite
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader>/ :<C-u>Denite grep <CR>
nnoremap <c-f> :<C-u>DeniteCursorWord grep<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file/rec<CR>


" denite-git key
nnoremap <leader>gl :<C-u>Denite gitlog:all<CR>
nnoremap <leader>gs :<C-u>Denite gitstatus<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>



"""""""""""""""""""""""""""""""""""""""""""""
"                Haskell                    "
"""""""""""""""""""""""""""""""""""""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"""""""""""""""""""""""""""""""""""""""""""""
"                Rust                       "
"""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1
let g:deoplete#sources#rust#racer_binary='/Users/hxl/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/hxl/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

""""""""""""""""""""""""""""""""""""""
"                Deol                "
""""""""""""""""""""""""""""""""""""""
"nmap <F5> :wa<CR>:vsplit term://make<CR> 
"nmap <F6> :wa<CR>:vsplit term://make 
nmap <F5> :wa<CR>:Deol -split=floating make<CR> 
nmap <F6> :wa<CR>:Deol -split=floating make 
au TermOpen * setlocal nornu
au TermOpen * :$

"""""""""""""""""""""""""""""""""""""""""""""
"                Neosnippet                       "
"""""""""""""""""""""""""""""""""""""""""""""
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"""""""""""""""""""""""""""""""""""""""""""""
"                Startify                   "
"""""""""""""""""""""""""""""""""""""""""""""
" 起始页显示的列表长度
let g:startify_files_number = 5
let g:startify_change_to_dir = 1

" 是否自动加载目录下的Session.vim, 很好用
let g:startify_session_autoload = 1
let g:ascii = [
            \'       ▄  █ ▄███▄   █    █    ████▄        ▄▄▄▄▄   ████▄ █    ', 
            \'      █   █ █▀   ▀  █    █    █   █       █     ▀▄ █   █ █    ', 
            \'      ██▀▀█ ██▄▄    █    █    █   █     ▄  ▀▀▀▀▄   █   █ █    ', 
            \'      █   █ █▄   ▄▀ ███▄ ███▄ ▀████      ▀▄▄▄▄▀    ▀████ ███▄ ', 
            \'         █  ▀███▀       ▀    ▀                               ▀', 
            \'        ▀                                                     ', 
              \]
                                                         
let g:startify_custom_header = g:ascii
let g:startify_list_order = ['sessions', 'files']


"" sth. setting
autocmd FileType yaml call s:yaml_my_settings()
function! s:yaml_my_settings() abort
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfunction


"
" --------------- key mapping --------------- "
nnoremap <leader>` :Deol -split<CR>
nnoremap <leader>w :Startify<CR>
nnoremap <leader>q :bd!<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space><CR>gv



" 自动保存
au FocusLost * silent! wa
" 自动保存上次编辑位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"color primary
"color onedark
set t_Co=256
set tgc
color gruvbox
