call plug#begin('~/.config/nvim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
" C++ 
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'goerz/jupytext.vim' 
Plug 'ervandew/supertab'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-unimpaired'
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-repeat'
Plug 'jupyter-vim/jupyter-vim'
Plug 'kamykn/spelunker.vim'
"Plug 'osamuaoki/vim-spell-under'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'bfredl/nvim-ipy'
" (Optional) Multi-entry selection UI.
" Plug 'zchee/deoplete-clang'
Plug 'tpope/vim-speeddating'
Plug 'chrisbra/NrrwRgn'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/utl.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"Plug 'davidhalter/jedi'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'zyedidia/literate.vim'
Plug 'dhruvasagar/vim-marp'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'liuchengxu/vim-which-key'
Plug 'preservim/nerdtree'
Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'cyrus-and/gdb-dashboard'
Plug 'cpiger/NeoDebug'
" Jupyter 
Plug 'vyzyv/vimpyter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sotte/presenting.vim'
if has('nvim')
  Plug 'codeindulgence/vim-tig'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

endif


" Presenting delims
"
au FileType org let b:presenting_slide_separator = '\v(^|\n)\*'
"let g:deoplete#enable_at_startup = 1
let g:org_indent=1
call plug#end()

" NEW Beginning
"airline 
let g:airline#extensions#tabline#enabled = 1
"" SPell
let g:enable_spelunker_vim = 1
let g:spelunker_max_suggest_words = 15
let g:spelunker_target_min_char_len = 4
let g:enable_spelunker_vim_on_readonly = 0
let g:spelunker_check_type = 1
let g:spelunker_highlight_type = 1
let g:spelunker_disable_uri_checking = 1
" ctrlp ext
let g:ctrlp_extensions = get(g:, 'ctrlp_extensions', [])
      \ + ['spelunker']
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

" TIG
"
let g:tig_executable = 'tig'
let g:tig_default_command = 'status'
let g:tig_on_exit = 'bw!'
let g:tig_open_command = 'enew'


set nospell
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.org,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.org,*.md call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

set termguicolors
"" clang
let g:ycm_clangd_binary_path = "/usr/bin/clangd"
"let g:deoplete#sources#clang#libclang_path = "/usr/lib64/libclang.so"
"let g:deoplete#sources#clang#clang_header = "/usr/include/clang"
" NEW END
"set spelllang=en
"set syntax on
"" Key Remaps
" toggle bar

"" .cpp .h switch
map <F4> :call CurtineIncSw()<CR>

nmap <F8> :TagbarToggle<CR>
"
"
"nnoremap <silent> <F7> :set spell!<cr>
"inoremap <silent> <F7> <C-O>:set spell!<cr>
"
"autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format

" spell under
"let g:spell_under='murphy'
"let g:loaded_spell_under

" Literate
let g:literate_find_codeblock = "<C-]>"
let g:literate_open_code = "<leader>c"
let g:literate_open_html = "<leader>h"

" Neomake 
" When writing a buffer (no delay).
"call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']


function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC0/online') == ['0']
  endif
  return 0
endfunction
if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif



" END
let g:nvim_ipy_perform_mappings = 0
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'cpp': ['clangd'],
    \ }

" LATEX shit 
let g:deoplete#sources#clang#sort_algo='priority'
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_delay = 10

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#custom#var()')
  let g:deoplete#custom#var = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
let g:python3_host_prog = '/usr/bin/python3'

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h 

set encoding=utf-8

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

" NERDComment
filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' }, 'cpp': { 'left': '//','right': '' }, 'py': { 'left': '#','right': '' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

map <F3> :NERDTreeToggle<CR>
set nu
set clipboard=unnamed

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''


let g:easytags_cmd = '/usr/bin/ctags'

let g:easytags_async = 1

let g:easytags_languages = {
\   'language': {
\     'cmd': g:easytags_cmd,
\           'args': [],
\           'fileoutput_opt': '-f',
\           'stdout_opt': '-f-',
\           'recurse_flag': '-R'
\   }
\}

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '~/.config/nvim/styles/foghorn.css'

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" org mode
let g:org_todo_keywords = [['TODO(t)', 'NEXT(n)', 'ASAP(a)',  'EVENTUAL(e)', 'FEEDBACK(f)', 'VERIFY(v)', '|', 'DONE(d)', 'DELEGATED(l)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(x)'],
      \ ['CANCELED(c)']]
 let g:org_agenda_files = ['~/SyncNotes/*.org']


" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" For ripgrep
" Note: rg is faster than ag
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
" For Pt(the platinum searcher)
" NOTE: It also supports windows.
call denite#custom#var('file/rec', 'command',
\ ['pt', '--follow', '--nocolor', '--nogroup',
\  (has('win32') ? '-g:' : '-g='), ''])
" For python script scantree.py
" Read bellow on this file to learn more about scantree.py
call denite#custom#var('file/rec', 'command',
\ ['scantree.py', '--path', ':directory'])

" Change matchers.
call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
\ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
\ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')

" Add custom menus
let s:menus = {}

let s:menus.zsh = {
        \ 'description': 'Edit your import zsh configuration'
        \ }
let s:menus.zsh.file_candidates = [
        \ ['zshrc', '~/.config/zsh/.zshrc'],
        \ ['zshenv', '~/.zshenv'],
        \ ]

let s:menus.my_commands = {
        \ 'description': 'Example commands'
        \ }
let s:menus.my_commands.command_candidates = [
        \ ['Split the window', 'vnew'],
        \ ['Open zsh menu', 'Denite menu:zsh'],
        \ ['Format code', 'FormatCode', 'go,python'],
        \ ]

call denite#custom#var('menu', 'menus', s:menus)

" Ag command on grep source
call denite#custom#var('grep', {
        \ 'command': ['ag'],
        \ 'default_opts': ['-i', '--vimgrep'],
        \ 'recursive_opts': [],
        \ 'pattern_opt': [],
        \ 'separator': ['--'],
        \ 'final_opts': [],
        \ })

" Ack command on grep source
call denite#custom#var('grep', {
        \ 'command': ['ack'],
        \ 'default_opts': [
        \   '--ackrc', $HOME.'/.ackrc', '-H', '-i',
        \   '--nopager', '--nocolor', '--nogroup', '--column'
        \ ],
        \ 'recursive_opts': [],
        \ 'pattern_opt': ['--match'],
        \ 'separator': ['--'],
        \ 'final_opts': [],
        \ })

" Ripgrep command on grep source
call denite#custom#var('grep', {
        \ 'command': ['rg'],
        \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
        \ 'recursive_opts': [],
        \ 'pattern_opt': ['--regexp'],
        \ 'separator': ['--'],
        \ 'final_opts': [],
        \ })

" Pt command on grep source
call denite#custom#var('grep', {
        \ 'command': ['pt'],
        \ 'default_opts': [
        \   '-i', '--nogroup', '--nocolor', '--smart-case'],
        \ 'recursive_opts': [],
        \ 'pattern_opt': [],
        \ 'separator': ['--'],
        \ 'final_opts': [],
        \ })

" jvgrep command on grep source
call denite#custom#var('grep', {
        \ 'command': ['jvgrep'],
        \ 'default_opts': ['-i'],
        \ 'recursive_opts': ['-R'],
        \ 'pattern_opt': [],
        \ 'separator': [],
        \ 'final_opts': [],
        \ })

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',
\ ['scantree.py', '--path', ':directory'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Custom action
" Note: lambda function is not supported in Vim8.
call denite#custom#action('file', 'test',
      \ {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
      \ {context -> denite#do_action(
      \  context, 'open', context['targets'])})
" Source specific action
call denite#custom#action('source/file', 'test',
      \ {context -> execute('let g:bar = 1')})

syntax on " This is required
colorscheme purify
set background=light
set background=dark
let g:airline_theme='purify'

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" jupytext 
let g:jupytext_enable = 1
let g:jupytext_filetype_map = {'md': 'pandoc'}
let g:jupytext_command = 'notedown'
let g:jupytext_fmt = 'markdown'
let g:jupytext_to_ipynb_opts = '--to=notebook'
" jupyter notebook
let g:nvim_ipy_perform_mappings = 0
map <silent> <c-s> <Plug>(IPy-Run)

let g:org_aggressive_conceal = 0
let g:org_heading_highlight_colors = ['Title', 'Constant', 'Identifier',
    \   'Statement', 'PreProc', 'Type', 'Special']

"" LeaderF
"
"" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
"" popup mode
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"
"let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"" neogdb default stuff
let g:neodbg_debugger              = 'gdb'           " gdb,pdb,lldb
let g:neodbg_gdb_path              = '/usr/bin/gdb'  " gdb path
let g:neodbg_cmd_prefix            = 'DBG'           " default command prefix
let g:neodbg_console_height        = 15              " gdb console buffer hight, Default: 15
let g:neodbg_openbreaks_default    = 1               " Open breakpoints window, Default: 1
let g:neodbg_openstacks_default    = 0               " Open stackframes window, Default: 0
let g:neodbg_openthreads_default   = 0               " Open threads window, Default: 0
let g:neodbg_openlocals_default    = 1               " Open locals window, Default: 1
let g:neodbg_openregisters_default = 0               " Open registers window, Default: 0
let g:neodbg_keymap_toggle_breakpoint  = '<F9>'         " toggle breakpoint on current line
let g:neodbg_keymap_next               = '<F10>'        " next
let g:neodbg_keymap_run_to_cursor      = '<C-F10>'      " run to cursor (tb and c)
let g:neodbg_keymap_jump               = '<C-S-F10>'    " set next statement (tb and jump)
let g:neodbg_keymap_step_into          = '<C-F11>'        " step into
let g:neodbg_keymap_step_out           = '<S-F11>'      " setp out
let g:neodbg_keymap_continue           = '<F5>'         " run or continue
let g:neodbg_keymap_print_variable     = '<C-P>'        " view variable under the cursor
let g:neodbg_keymap_stop_debugging     = '<S-F5>'       " stop debugging (kill)
let g:neodbg_keymap_toggle_console_win = '<F6>'         " toggle console window
let g:neodbg_keymap_terminate_debugger = '<C-C>'        " terminate debugger
