"""-------- pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
:Helptags

""" -------- GUI --------------
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 9
" set guioptions-=TrRlLb
" set guioptions+=ic
set guioptions=aegmtic

"""------- kolorki
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
""autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
""au InsertLeave * match ExtraWhitespace /\s\+$/

"podglad numerow kolorow ~/download/xtrem-colortest -w -r syntax on musi byc "przed kolorkami
set t_Co=256
let g:molokai_original = 0
colorscheme molokai
hi Pmenu ctermfg=220 ctermbg=238 guibg=#511151
hi PmenuSel ctermfg=lightyellow ctermbg=brown guibg=#333388
hi PmenuSbar ctermbg=6
hi PmenuThumb ctermfg=3

""" ------ cursorline
" set cursorline
" hi CursorLine cterm=NONE ctermbg=234 guibg=NONE

""" ------ statusline
hi StatusLine ctermbg=black
hi StatusLineNC ctermbg=black
set laststatus=2
set statusline=%<\ %f\ %h%r%=%l/%L\ (%p%%) 

" set nonumber

""" ------- powerline
" inny colorscheme aby byla czarna lina przy vertical split
let g:Powerline_colorscheme='skwp' 
" wplywa na multipolcenie taloe jak leader \ev \es \s
set timeoutlen=1000
set scrolloff=6

""" -------- leader
" let mapleader = ","
let mapleader = " "
" nmap , <space> # second leader key ! lepiej nie zeby sie odzwyaczic

"""--------- hidden allow edited buffers
set hidden

set clipboard=unnamedplus
" set clipboard=autoselect

"""----------------------------- Python
"""--------- pythonmode
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_folding = 0
" flakes + write dziala dosc szybko ale nie wykrywa wszystkich bledow let
let g:pymode_indent = 0 
let g:pymode_lint = 1
let g:pymode_rope = 0
" Show error message if cursor placed at the error line  *'g:pymode_lint_message'*
let g:pymode_lint_message = 0
" on save
" Check code on every save (if file has been modified)  *'g:pymode_lint_on_write'*
let g:pymode_lint_on_write = 0
" Check code on every save (every)                    *'g:pymode_lint_unmodified'*
let g:pymode_lint_unmodified = 0
" Check code when editting (onfly)                        *'g:pymode_lint_on_fly'*
let g:pymode_lint_on_fly = 0

" Default code checkers (you could set several)         *'g:pymode_lint_checkers'*
" Values may be choosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.
let g:pymode_lint_checkers = ["pyflakes"]
" let g:pymode_lint_checker = "pylint"
let g:pymode_lint_signs = 0
let g:pymode_lint_config = 'pylint.rc2'
    






"
" PyMode Syntax Highlight
"
let g:pymode_syntax = 1 
let g:pymode_syntax_all = 0 
" 
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_builtin_types = 0
let g:pymode_syntax_doctests = 0 
let g:pymode_syntax_highlight_equal_operator = 0
let g:pymode_syntax_highlight_exceptions = 0
let g:pymode_syntax_highlight_self = 0
let g:pymode_syntax_highlight_stars_operator = 0
let g:pymode_syntax_indent_errors = 0
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_syntax_string_format = 0 
let g:pymode_syntax_string_formatting = 0 
let g:pymode_syntax_string_templates = 0

" For fast machines
" let g:pymode_syntax_slow_sync = 0
" overwrite
" -----------------------------------------------------
"
" pylint dziala lepiej ale jest zawolny na przy kazdym zapisie
let g:pymode_utils_whitespaces = 0
" auto jump on/off
let g:pymode_lint_jump = 1
let g:pymode_lint_ignore = 'W402,W0611,C0324,W0612,W0511,C0323,W0622,C0302,W806,C0322,R0921,R0914,W0101,W801,W0404'
"let g:pymode_lint_select = 'E0611'
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = '<leader>ib'
let g:pymode_run = 0
let g:pymode_virtualenv = 1
"let g:pymode_run_key = '<leader>r'

nmap ]m ]M
nmap [m [M

function! PythonMappings()
	nmap <buffer> <leader>iP ofrom IPython import embed;embed()<ESC>:w<cr>
	nmap <buffer> <leader>ip ofrom vipdb import embed;embed()<ESC>:w<cr>
	" ipython debug 
	nmap <buffer> <leader>id oimport vipdb;vipdb.set_trace()<ESC>:w<cr>
	nmap <buffer> <leader>ic oimport vipdb;vipdb.cond=True<ESC>:w<cr>
	nmap <buffer> <leader>ir oimport vipdb<cr>if hasattr(vipdb,'cond'):vipdb.set_trace()<ESC>:w<cr>
	nmap <buffer> <leader>l :PymodeLint<cr>
    nmap <buffer> <leader>L :call Flake8()<cr>
	" " pudb debugger
	" nmap <buffer> <leader>iu o<esc>Simport pudb;pudb.set_trace()<ESC>:w<cr>
	"" fix na diff doget - z brancha johntyree python-mode
	" ounmap <silent> <buffer> o
	"" python run
	nmap <buffer> <F9> :silent up\|QuickRun -split 10<cr>
    vmap <buffer> <F9> :QuickRun -split 10<cr>
	" map <F9> :up<bar>!/usr/bin/env python %<CR>
	map <leader><F9> :up<bar>!/usr/bin/env python %  
    "
    " map <leader>g :RopeGotoDefinition<cr>
    " works badly
    " inoremap <silent> <buffer> <tab> <C-R>=RopeCodeAssistInsertMode()<CR>
    "
    set nonumber
    compiler python
    " wytlacz elcim i signs

    " terminal test
    nmap <silent> <leader>tt :w<bar>call ScreenShellSend("./run_tests.py <c-r>=tagbar#currenttag('%s','')<cr>")<cr>

    " termianal python 
    map <leader>tp :up<bar>call ScreenShellSend("python <c-r>%")<cr>
    map <leader>ti :up<bar>call ScreenShellSend("ipython -i <c-r>%")<cr>

endfunction
au FileType python call PythonMappings()

"----------------------- XML mappings
function! XMLMappings()
    vmap <buffer> gq :!xmllint --format -<cr>
endfunction
au FileType xml call XMLMappings()

"------------------------ RUBY
function! RubyMappings()
	""" binding pry 
	nmap <buffer> <leader>ip obinding.pry<ESC>:w<cr>
	""" ruby run
	nmap <buffer> <F9> :up\|!ruby %<cr> 
	imap <buffer> <F9> <Esc><f9>
	nmap <buffer> <leader><F9> :up\|!ruby % 
    
    """ navgigation goto
    " map <leader>g <C-]>
    nmap gd <C-]>
endfunction
au FileType ruby call RubyMappings()

" ruby/thor
au BufRead,BufNewFile *.thor set filetype=ruby

"------------------------ Golang
function! GoMappings()
	""" ruby run
	" nmap <buffer> <F9> :up\|!go run %<cr> 
	nmap <buffer> <F9> :silent up\|QuickRun -split 5<cr>
	nmap <buffer> <leader>r <f9>
	imap <buffer> <F9> <Esc><f9>
	nmap <buffer> <leader><F9> :up\|Make<cr>
    
    map <leader>tp :up<bar>call ScreenShellSend("go run <c-r>%")<bar><cr>
    """ navgigation goto
    " map <leader>g <C-]>
    " nmap gd <C-]> # depracted by vim-godef

    nmap K :Godoc<cr>

    " compiler go

    " autocmd FileType go autocmd BufWritePre <buffer> Fmt
    
    " make supertab works better
    let g:SuperTabDefaultCompletionType = "context"

    nnoremap <buffer> <Leader>a :exe 'Import ' . expand('<cword>')<CR>

    " test current pkg
    nmap <leader>tt :up<bar>GoTestVerbose<cr>

    nmap <silent> <leader>m :up\|make<cr>

    nmap <buffer> <leader>w :silent up<cr>

endfunction
au FileType go call GoMappings()

function! SQLMappings()
    map gq :SQLUFormatter<cr>

endfunction
au FileType sql call SQLMappings()


"----------------------------- OTHER hacks
""" save shift (lost repeat of t,f,T,F)
noremap ; :
"nnoremap : ;

""" delaing with .vimrc
" config edit/run
noremap <leader>ce :e $MYVIMRC<CR>
noremap <leader>cr :so $MYVIMRC<CR>

""" quickfix window navigation
nnoremap ]q :execute "try \n cnext \n catch \n try \n cfirst \n catch \n cc \n endtry \n endtry"<cr>
nnoremap [q :execute "try \n cprevious \n catch \n try \n clast \n catch \n cc \n endtry \n endtry"<cr>

""" location window navigation
nnoremap ]l :execute "try \n lnext \n catch \n  lfirst \n endtry"<cr>
nnoremap [l :execute "try \n lprevious \n catch \n  llast \n endtry"<cr>

" S for subsitute inner word from yanked text
" change inner word and in insert mode yank from " and exit inster mode :)
nnoremap <leader>s "_ciw<c-r>"<esc>

" numberlines toggle
nnoremap <leader>n :set invnumber<cr>

" 
" nnoremap <leader>p :set paste<cr>p:set nopaste<cr>

" quickfixclear
" nmap <leader>qc :QuickFixClear<cr>

""" -------- Standard options
" set nonumber
set nowrap
"set paste
set comments=

""" search
set incsearch
set smartcase
set ignorecase
" highlight search
set hlsearch
" highlight search reset
map <leader>/ :nohlsearch<cr>
"<bar>QuickFixClear<cr>:SignClearAll<cr>

" delete without yank
" nmap <silent> <leader>d "_d
" vmap <silent> <leader>d "_d

""" move between windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h


""" wciecia
set smarttab
set expandtab
set autoindent
set tabstop=4 sw=4 softtabstop=4

"set smartindent
au FileType ruby set ts=2 sw=2 softtabstop=2
au FileType html set ts=2 sw=2 softtabstop=2 nocindent
au FileType python set ts=4 sw=4 softtabstop=4
au FileType mkd set shiftwidth=2

""" wyjscie z trybu insert przez wpisanie dwa razy jj
inoremap jj <ESC>

""" Backspace fix
set backspace=indent,eol,start


""" ------- NerdTree
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <leader><F2> :NERDTreeFind<CR>
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
" set Enter/Return to activate a node
let NERDTreeMapActivateNode='<CR>'
" always change CWD
let NERDTreeChDirMode = 2
" more colors 
let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$', '\~$']

""" -------- Ctags
map <leader><F8> :!mkdir -p .tags;cd .tags;ctags -f .tags/tags --verbose=yes --recurse=yes --exclude=tmp --exclude=rhodecode/lib/dbmigrate -fields=zK . <cr>
map <F8> :!mkdir -p .tags;cd .tags;ctags -f tags --languages=HTML,Java,JavaScript,Python,Ruby,Go --totals --verbose=no --recurse=yes --exclude=tmp --exclude=dbmigrate --fields=zK .. <cr>
" au FileType python map <F8> :!ctags -f .tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp . <cr>
au FileType python map <F8> :!mkdir -p .tags;cd .tags;ctags -f ._tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK ..;fgrep -v kind:variable ._tags >tags;rm ._tags<cr>
au FileType ruby map <F8> :!mkdir -p .tags;cd .tags;ctags -f tags --languages=Ruby --langmap=Ruby:.rb.thor --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK .. <cr>
au FileType haskell map <F8> :!regenerate-haskell-tag.sh<cr>
" au FileType haskell let g:ctrlp_buftag_ctags_bin = '/home/ppalucki/.cabal/bin/hothasktags'
"
""" tags file
" specjalnie nizej w podkatalogu aby nie psulo mi wyszukiwania w pycharmie
set tags=.tags/tags
"set tags+=./.tags
"set tags+=/home/ppalucki/.rvm/rubies/ruby-1.9.2-p180/tags
"set tags+=$HOME/.vim/tags/python.ctags

let g:ctrlp_buftag_types = {
\'haskell' : {
  \ 'bin': '/home/ppalucki/.cabal/bin/lushtags',
  \ 'args': 'f --'
  \ },
\ }

""" HaskMappings
function! HaskellMappings()
	map <F9> :!ghc %<cr>

    " termianal python 
    map <leader>tp :up<bar>call ScreenShellSend("runhaskell <c-r>%")<bar><cr>

endfunction
au FileType haskell call HaskellMappings()
" let g:riv_link_cursor_hl=0



"" repeat last command
map <leader>r @:

""" rest doc riv run 
function! RstMappings()
	map <F9> :up<bar>!cd ..;make html<cr>
	map <leader><F9> :up<bar>!cd ..;make clean html<cr>
	""" fix of italic overbold!
	highlight rstEmphasis cterm=NONE ctermfg=3
endfunction
au FileType rst call RstMappings()
" let g:riv_link_cursor_hl=0

" --------------------------- spell
" fix na spell, ze spellcap mi nie oznacza eelementow, ktore maja nie poprawne
" skladanie (duza litera na poaczatku)
highlight SpellCap ctermbg=None
" fixnij za pomoca pierwszego dopasowania
nmap z9 1z=

""" ------  Last position
"This autocommand jumps to the last known position in a file just after
"opening it, if the '"' mark is set:
"wg :h last-postion-jump
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"
" improved version from 
" from:
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" function! ResCur()
"   if line("'\"") <= line("$")
"     normal! g`"
"     return 1
"   endif
" endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call setpos(".", getpos("'\""))
augroup END

""" ------ sudo write
command! W w !sudo tee % > /dev/null

""" tagbar
map <leader><F3> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_width = 60

""" ----- fuzzyfinder
" map <F3> :FufBufferTag<CR>
" map <F4> :FufMruFileInCwd<CR>
" map <leader><F4> :FufMruFile<CR>
" map <F5> :FufBuffer<CR>
" map <leader><F5> :FufQuickfix<CR>
" map <F6> :FufFile<CR>
" map <leader><F6> :FufCoverageFile<CR>
" map <F7> :FufTag!<CR>
" map <leader><F7> :FufTag<CR>
" map <leader>o :FufJumpList<CR>
" let g:fuf_modesDisable = [ 'mrucmd', ]
" let g:fuf_coveragefile_globPatterns = ['**/*.rb', '**/*.erb', '**/*.haml', '**/*.html', '**/*.xml', '**/*.js', '**/*.sh', '**/*.py', '**/*.yml', 'Gemfile', '**/*.thor', '**/*.rake', '**/*.yaml', '**/signed_curl', '**/*.rst', '**/*.json', '**/*.java', '**/*.xhtml', '**/*.sql']
" let g:fuf_maxMenuWidth = 240
" let g:fuf_ignoreCase = 1
" let g:fuf_mrufile_maxItem = 6000
" let g:fuf_mrufile_maxItemDir = 1500
" let g:fuf_learningLimit = 5000
" let g:fuf_autoPreview = 0

""" ----- mouse
""" wiecej szkody z myszki niz pozytku
" set mouse=nvih
set mouse=
set ttymouse=xterm2
set nomousehide

""" ----- grep (plugin) 
" let Grep_Default_Filelist = '*.rb *.py *.html *.erb *.js *.sh *.thor *.rake *.yaml'
" let Grep_Default_Options = '-i'
" let Grep_OpenQuickfixWindow = 1
" let Grep_Skip_Dirs = 'tmp'
" let Grep_Shell_Escape_Char = '\'
"NOT USED
"
"map <leader><F6> :Rfgrep<CR> map <leader>h :Rfgrep<cr> map <leader>h :Ack
"--py Ack bez jumpa
map <leader>h "ayiw:Ack! "<C-r>a"
vmap <leader>h "ay:Ack! "<C-r>a"
map <leader>H "ayiw:Ack! --all "<C-r>a"
vmap <leader>H "ay:Ack! --all "<C-r>a"
au FileType python map <buffer> <leader>h "ayiw:Ack! --python "<C-r>a"
au FileType python vmap <buffer> <leader>h "ay:Ack! --python  "<C-r>a"
au FileType ruby map <buffer> <leader>h "ayiw:Ack! --ruby "<C-r>a"
au FileType ruby vmap <buffer> <leader>h "ay:Ack! --ruby "<C-r>a"
au FileType rst map <buffer> <leader>h "ayiw:Ack! --rst "<C-r>a"
au FileType rst vmap <buffer> <leader>h "ay:Ack! --rst "<C-r>a"
" let g:ackprg = 'ag --nogroup --nocolor --column'
"
""" Search and replace
" http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim/5686810#5686810
" replace in many buffers after ,h (last searched element)
nmap <leader>Y :Qdo %s/<C-r>a//gc<left><left><left>
" replace normal mode with last searched element elmenet
nmap <leader>y :.,$s///gc<left><left><left>
" replace last search element ("/ register) in given selection
vmap <leader>y :s///gc<left><left><left>
" or manual procedure
" ---------- manual --------------
" Put the cursor on foo.
" Press * to search for the next occurrence.
" Type ciw (change inner word) then bar then press Escape.
" Press n (move to next occurrence) then . (repeat change).
" Repeat last step

" Ack z jumpa
" map <leader>H yiw:Ack! "<C-r>""
" vmap <leader>H y:Ack! "<C-r>""
" au FileType python map <leader>H yiw:Ack --python "<C-r>""
" au FileType python vmap <leader>H y:Ack --python  "<C-r>""
" au FileType ruby map <leader>H yiw:Ack --ruby "<C-r>""
" au FileType ruby vmap <leader>H y:Ack --ruby "<C-r>""


""" ---- saveall shortcut
map ZA :wall<CR>
map ZW :qa<CR>
""" write/quit
" aka ZZ
map <leader>w :up<CR>
map <leader>W :w!<CR>
map <leader>q :q<CR>
" aka ZQ
map <leader>Q :q!<CR>


""" VCS (git bzr)
"vimdiff current vs git head (fugitive extension)
nnoremap <Leader>vd :Gdiff<cr>
"switch back to current file and closes fugitive buffer
nnoremap <Leader>vD :diffoff!<cr><c-w>h:bd<cr>
nnoremap <Leader>vs :Gstatus<cr>
nnoremap <Leader>vc :Gcommit<cr>
nnoremap <Leader>vvc :Gcommit --verbose<cr>
nnoremap <Leader>vac :Gcommit --amend<cr>
" log current file
nnoremap <silent> <Leader>vl :Glog -n 50<cr>
" last 10 commits
nnoremap <Leader>vL :Glog -n 50 --<cr>
" gblame
nnoremap <Leader>vb :Gblame<cr>
vnoremap <Leader>vb :Gblame<cr>

" aka vim fetch&merge
nnoremap <Leader>vm :Git pull<cr> 
nnoremap <leader>vp :Git push<cr>
nnoremap <leader>vw :Gwrite<cr>
nnoremap <leader>vr :Gread<cr>

""" ---- buffers
" buffer write delete
map <leader>bw :w<bar>BD<cr>
" buffer delete
map <leader>bd :BD<cr>
" close all but this one (and not saved!)
map <leader>bo :BufOnly<cr>

" buffer next/previous
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bn :bn<cr>

""" json
autocmd BufNewFile,BufRead *.json set ft=javascript

""" ConqueTerm
let g:ConqueTerm_ReadUnfocused = 1

""" -----------------------------
""" Screen Terminal
""" -----------------------------
" nie zamykaj screena bo czesto zabija mi dodatwkoeo konsole
" domsylnie kiluje wszystkie screene! a bez tego musze dwa razy zamykac vima
" let g:ScreenShellQuitOnVimExit = 0 
let g:ScreenShellHeight = 10
let g:ScreenShellGnuScreenVerticalSupport = 'native'
" terminal bash vertical
map <leader>tb :ScreenShellVertical bash<cr>
" terminal base horizontal
map <leader>tB :ScreenShell bash<cr>
" terminal send
vmap <leader>ts :ScreenSend<cr>
" termianal rerun 
map <leader>tr :up<bar>call ScreenShellSend("!!")<cr>
" terminal exit
map <leader>te :call ScreenShellSend('exit')<cr>
" terminal line - begin then send visual till end and terminal send
nmap <leader>tl _v$<leader>ts
" terminal all
nmap <leader>ta ggvG$<leader>ts

function! ScreenSendPaste1()
  let g:ScreenShellSendPrefix = '%cpaste'
  let g:ScreenShellSendSuffix = '--'
endfunction 
function! ScreenSendPaste2()
  let g:ScreenShellSendPrefix = ''
  let g:ScreenShellSendSuffix = ''
endfunction 
" terminal paste
vmap <leader>tp :<bs><bs><bs><bs><bs>call ScreenSendPaste1()<bar>'<,'>ScreenSend<cr>:call ScreenSendPaste2()<cr>
" terminal word - (send)
nmap <leader>tw viw<leader>ts
""" Dispatch & Make

" ORGinal nmap <leader>ty :compiler! python<cr>:set makeprg=./run_tests.py\ <c-r>=tagbar#currenttag('%s','')<cr><cr>:Make<cr>
if !has('python3')
py <<EOF
last_test_tag = None
from vim import eval as e
from vim import command as c
def _make_test(tag):
    c(':up')
    c(':compiler! python')
    c(r":set makeprg=XTB\=off\ ./run_tests.py\ %s"%tag)
    c(':Make')

def make_current_test():
    'run current tag in Make'
    global last_test_tag
    last_test_tag = e("tagbar#currenttag('%s','')")
    _make_test(last_test_tag)

def make_last_test():
    'rerun last runned test'
    if not last_test_tag:
        return
    _make_test(last_test_tag)

def debuging_on():
    'prepare synchronize in ipdb'
    pass

EOF
endif

" terminal yank test
nmap <leader>ty :py make_current_test()<cr>
" terminal global test
nmap <leader>tg :py make_last_test()<cr>

" termianl yank all tests
nmap <leader>tY :compiler! python<cr>:set makeprg=./run_tests.py<cr><cr>:Make<cr>


""" pi_paren
" bez oznaczania nawiasow
let loaded_matchparen = 1
" NoMatchParen
set noshowmatch

""" disable fold
au FileType rst set nofoldenable
" au FileType rst :NoMatchParen

set nofoldenable
au FileType python set nofoldenable
au FileType python set foldmethod=manual
" au FileType python :NoMatchParen
" au FileType go :NoMatchParen

""" RIV
let g:riv_fold_auto_update = 0
let g:riv_web_browser = "google-chrome"
let docs_tv = { 'path': '~/workspace/getmedia/docs_tv/source', 'build_path': '~/workspace/getmedia/docs_tv/build'}
let g:riv_projects = [docs_tv]


""" swap files
" insert mode bash style
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" cmdline-editing bash style
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
" alt-p, alt-n history search
cnoremap p <Up>
cnoremap n <Down>

" hist like ctrl+p/ctrl+n
" cnoremap <C-j> <t_kd>
" cnoremap <C-k> <t_ku>

" history
" Useful settings
set history=700
set undolevels=700

" set noswapfile

" slowness fix!!!
au FileType ruby set nocursorline
set foldmethod=manual 
au FileType rst set nocursorline

" ----------------------------------------- JAVA ECLIM
function! JavaMapping()
    " ----------- run
    "- Executes the java using your project's main class.
    nmap <F9> :w<bar>:Java<cr>
    imap <F9> <Esc><F9>
    map <leader><F9> :Java

    " ------------ javadoc
    nnoremap <buffer> <leader>k :JavaDocPreview<cr>
    nnoremap <buffer> <leader>K :JavaDocSearch -x declarations<cr>

    " ----------- search
    " java go
    "- Perform a context sensitive search for the element under the cursor.
    " nnoremap <buffer> <leader>g :JavaSearchContext<cr>
    nnoremap <buffer> gd :JavaSearchContext<cr>
    "[-p <pattern>] [-t <type>] [-x <context>] [-s <scope>] - Search for
    "classes, methods, fields, etc.  (With pattern supplied, searches for the
    "element under the cursor).  nnoremap <leader>js :JavaSearch

    " ------------ create
    " Create a java bean getter method.  nnoremap <leader>jg :JavaGet<cr>
    " Create a java bean setter method.  nnoremap <leader>js :JavaSet<cr>
    " Create both a java bean getter and setter method.
    nnoremap <leader>jg :JavaGetSet<cr>
    " Creates class constructor, either empty or based on selected class "fields.
    noremap <leader>jc :JavaConstructor<cr>

    " ------------ view
    "- View the type hierarchy tree.
    nnoremap <leader>jh :JavaHierarchy<cr>
    "- View implementable / overridable methods from super classes and implemented interfaces.
    nnoremap <leader>jim :JavaImpl<cr>
    "- View list of methods that delegate to the field under the cursor.
    nnoremap <leader>jd :JavaDelegate<cr>

    " --------- junit
    " [testcase] - Allows you to execute junit test cases.
    nnoremap <leader>ju :JUnit
    " Attempts to find the corresponding test for the current source file.
    nnoremap <leader>juf :JUnitFindTest<cr>
    " Similar to :JavaImpl, but creates test methods.
    nnoremap <leader>jui :JUnitImpl<cr>
    "[testcase] - Allows you to view the results of a test case.
    nnoremap <leader>jur :JUnitResult

    " ----------- import
    "- Import the class under the cursor.
    nnoremap <leader>ji :JavaImport<cr>
    "- Import undefined types, remove unused imports, sort and  imports.
    nnoremap <leader>jio :JavaImportOrganize<cr>

    " ------------ correct
    "- Suggest possible corrections for a source error.
    nnoremap <leader>ja :JavaCorrect<cr>



    " ------------refactoring (rename/move)
    "[new_name] - Rename the element under the cursor.
    nnoremap <leader>jr :JavaRename
    "[new_package] - Move the current class/interface to another package.
    nnoremap <leader>jm :JavaMove

    " ----------- java doc update
    "- Adds or updates the comments for the element under the cursor.
    nnoremap <buffer> <leader>jdc :JavaDocComment<cr>

    " ------------- class path
    "[-d <delim>] - Echos the project's classpath delimited by the system path
    "separator or the supplied delimiter.  nnoremap <leader>jc :JavaClasspath
    "-d \n<cr>
    " - List known JDK/JRE installs.
    nnoremap <leader>jli :JavaListInstalls<cr>

    " --------- format
    "- Formats java source code.
    noremap <buffer> <leader>jf :JavaFormat<cr>

    " --------------- javadoc generation
    "[file, file, ...] - Executes the javadoc utility against all or just the supplied source files.
    "jd zajete przez javadelegate
    " nnoremap <leader>jd :Javadoc

    " --------------- config
    " super tab for java uses user completetions
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

    " eclim
    let g:EclimJavaSearchSingleResult = "edit"
    let g:EclimJavaCompleteCaseSensitive = 1
endfunction
au FileType java call JavaMapping()

"
""" ------------------ scala ------------
function! ScalaMapping()
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    " map <leader>g :ScalaSearch<cr>
    map gd :ScalaSearch<cr>
endfunction
au FileType scala call ScalaMapping()
let g:EclimScalaSearchSingleResult = 'edit'

""" ECLIM
let g:EclimPythonValidate = 0
let g:EclimShowErrors = 1
" let g:EclimSignLevel = 0

"""""""""""""""""""""""""""""""""" colore rerun
" set t_Co=256
" colorscheme desert256
" colorscheme molokai
" let g:molokai_original = 1
" hi Pmenu ctermfg=220 ctermbg=238 guibg=#511151
" hi PmenuSel ctermfg=lightyellow ctermbg=brown guibg=#333388
" hi PmenuSbar ctermbg=6
" hi PmenuThumb ctermfg=3
"
"
""""""""""""" spell
set spellcapcheck=0

"""""""""""" modeline
set modeline

"""""""""""" mkd - markdown & textile
" surround with asterisk
" bold/em
au FileType mkd set nofoldenable
au FileType mkd nmap <leader>e ysiw*
au FileType mkd vmap <leader>e S*
au FileType mkd nmap <leader>E ,el,e
au FileType mkd vmap <leader>E ,el,e

au FileType mkd nmap ds* F*xf*xb

au FileType mkd hi htmlItalic term=bold cterm=bold gui=bold ctermfg=231
au FileType mkd hi htmlBold term=bold cterm=bold gui=bold ctermfg=229

au FileType mkd hi htmlItalic term=bold cterm=bold gui=bold ctermfg=231
au FileType mkd hi htmlBold term=bold cterm=bold gui=bold ctermfg=229

" zwykly markdowna
au FileType markdown nmap <leader>e ysiw*
au FileType markdown vmap <leader>e S*
au FileType markdown nmap <leader>E ,el,e
au FileType markdown vmap <leader>E ,el,e
au FileType markdown nmap ds* F*xf*xb

" testtile
au FileType textile nmap <leader>e ysiw*
au FileType textile vmap <leader>e S*
au FileType textile nmap <leader>E ,el,e
au FileType textile vmap <leader>E ,el,e
au FileType textile nmap ds* F*xf*xb

" zrob tabele |adsaa|asdfasd|asdfasdf| dla redmine na zaznaczonym obszarze!
" redmine TABLE
" au FileType textile vmap <leader>T :s/;/\|/g<cr>gv:norm A\|<cr>gv:norm I\|<cr>
" au FileType textile vmap <leader>C :s/,/\|/g<cr>gv:s/"//g<cr>gv:norm A\|<cr>gv:norm I\|<cr>
au FileType textile vmap <leader>T :!csv_to_redmine.py<cr>

""" ------ highlith identifiaction
""" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""" kolorowanie przykladow w helpie 
hi helpExample ctermfg=Magenta

""" move parameter right
map <leader>m "qdt,dwep"qpb

""" gundo
map <leader>u :GundoToggle<CR>

" find occurences - search current word but without scroll
nmap <leader>f "myiwh/<c-r>m<cr>

" fix na colory diffa (change bez tla - bylo szare)
" sprawdz kolory: colortest -w -s (w bashu!)
hi DiffChange ctermbg=NONE
hi DiffDelete ctermbg=53
hi DiffAdd ctermbg=53
hi DiffText ctermbg=52 

" set number

""" ----- ultisnip
let g:UltiSnipsListSnippets = '<c-l>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "myultisnips"]
let g:UltiSnipsJumpBackwardTrigger = '<c-u>'

""" ----- ctrlp
map <F3> :CtrlPBufTag<CR>
map <F4> :let g:ctrlp_mruf_relative=1<bar>CtrlPMRUFiles<CR>
map <leader><F4> :let g:ctrlp_mruf_relative=0<bar>CtrlPMRUFiles<CR>
map <F5> :CtrlPTag<CR>
map <F6> :CtrlPModified<CR>
map <leader><F6> :CtrlPBranch<CR>
map <F7> :CtrlPBuffer<CR>
" nmap <leader><F4> :CtrlPLine<cr>
" nmap <F6> :CtrlPChangeAll<cr>
" nmap <leader><F6> :CtrlPChange<cr>
" nmap <leader>o :CtrlPChangeAll<cr>
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v(\.(git|hg|svn|bzr))|(htmlcov)|(tmp)$',
	\ 'file': '\v(\.(exe|so|dll|pyc|orig|class|tex|png|gif))|(index|MERGE_MSG|COMMIT_EDITMSG)|(\.LOCAL\..*)$',
	\ }

let g:ctrlp_match_window_bottom = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_exclude = '\v(\.git)'

nmap <c-]> :CtrlPtjump<cr>

" repeat last movement
noremap \ ;

" replast move command
let repmo_key = "\\"
let repmo_revkey = "<bar>"
" let g:repmo_mapmotions = "j|k h|l <C-E>|<C-Y> zh|zl ]c|[c ]]|[[ ]m|[m ]q|[q"
let g:repmo_mapmotions = "j|k h|l <C-E>|<C-Y> zh|zl"

" diff jump with ()
nn <expr> ( &diff ? "[c" : "("
nn <expr> ) &diff ? "]c" : ")"

" vsplit tag
nmap <leader><C-]> :vsplit <CR>:exec("tag ".expand("<cword>"))<CR>zt<c-w>r<c-w><c-w>
nmap <C-\> :split<CR>:exec("tag ".expand("<cword>"))<CR>

" swap ' with `
nnoremap ' `
nnoremap ` '

" set nonumber

" sorting - usefull for imports sorting
"" vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
" BETTER to user .
" vnoremap < <gv0 " better indentation
" vnoremap > >gv0  " better indentation

" autosource write of .vimrc
" autocmd! bufwritepost .vimrc source %

" easier formatting of paragraphs
"SLABO formatuje kod pyythona
" vmap Q gq
" nmap Q gqap
"
""" ------- AutoComplete fix
" set completeopt=longest,menu 
"" auto be jedi plugin
"
""""""""""" supertab
" let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestEnhanced = 0
let g:SuperTabLongestHighlight = 1
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Settings for jedi-vim
" jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" TAB is reserved for omnifunc
" let g:jedi#autocompletion_command = "<tab>"
let g:jedi#auto_vim_configuration = 1
let g:jedi#goto_assignments_command = "<leader>d"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#usages_command = "<leader>z"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0
autocmd FileType python setlocal completeopt-=preview

" Open last/alternate buffer
noremap <Leader><Leader> <C-^>

" Map Q to repeat the last recorded macro
" exmode sie czasem jednak przydaje - a jednak nie dziala jak chce (lepiej
" uzyc gQ
map Q @@

" undo-persistent
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" python import
let g:pythontagimportcurrentword = "<leader>a"
let g:pythontagimport_from = 1
let g:pythontagimport_from_mod = 0
let g:pythontagimport_as = 0
let g:pythontagimport_full  = 0
let g:pythontagimport_prefix = 'getmedia.'

" yank current buffer filename to register
" http://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
nmap cp :let @* = expand("%:p")<bar>let @+ = expand("%:p")<cr>

" xml syntax fix
hi link xmlTagName Identifier
hi link xmlTag Identifier
hi link xmlEntity String
hi link xmlEntityPunct String

" and xml folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Add the virtualenv's site-packages to vim path
let g:pymode_virtualenv = 1
" UWAGA: zeby dzialalo jedi ze zmiana interpretera
" trzeba zrobic linka
" (flask)~/.virtualenvs/flask/lib$ ln -s python3.3 python2.7
" poniewaz activate_this.py szukanie domylsnie katalogi site-packages w
" lib/python%VERSION/site-packages i wtedy go nie ma !
" OBA SA CHYBA POPSUTE!
" if !has('python3')
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
"     print 'activated: ', activate_this
" EOF
" 
" elseif has('python3')
" 
" py3 << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     # execfile(activate_this, dict(__file__=activate_this))
"     exec(open(activate_this).read(), dict(__file__=activate_this))
"     print('activated: ', activate_this)
" EOF
" 
" endif
"vimchat
" let g:vimchat_buddylistwidth = 30 "width of buddy list, default is 30
" let g:vimchat_logpath = path to store log files, default is ~/.vimchat/logs
" let g:vimchat_logchats = (0 or 1) default is 1 -- 0 will not log,
let g:vimchat_otr = 0 "(0 or 1) default is 0 -- enable otr or not
" let g:vimchat_logotr = (0 or 1) default is 1 -- log otr convos or not
let g:vimchat_statusicon = 0 "(0 or 1) default is 1 -- use a gtk status icon?
" let g:vimchat_blinktimeout = timeout in seconds, default is -1
" let g:vimchat_buddylistmaxwidth = max width of buddy list window, default ''
" let g:vimchat_timestampformat = format of the message timestamp, default "[%H:%M]"
" let g:vimchat_showPresenceNotification = notification if buddy changed status, comma-separated list of states, default ""
let g:vimchat_libnotify = 0

""" source vim file type 
au FileType vim :nmap <F9> :up<cr>:%y<bar>@"<cr>
au FileType vim :setlocal keywordprg=:help

""" example of python
if !has('python3')
py <<EOF
def testvima():
    import vim
    # print 'oto vim'
    # print vim.current.window
    # print vim.current.buffer
    print(vim.eval("tagbar#currenttag('%s','')"))
EOF
endif

nmap <leader>k :py testvima()<cr>

" vimroom
let g:vimroom_sidebar_height=0
" let g:vimroom_min_sidebar_width=100
let g:vimroom_background = "red"
let g:vimroom_width = 120

""" -------------- Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap Ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
" nnoremap Uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap Ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap Uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap Uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap Ue :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap Uc :<C-u>Unite -no-split -buffer-name=command  -start-insert command<cr>
nnoremap Uf :<C-u>Unite -no-split -buffer-name=function  -start-insert function<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  " normal 
  nmap <buffer> <ESC>      <Plug>(unite_exit)
  nmap <buffer> <C-c>      <Plug>(unite_exit)
  " insert
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
endfunction

""" ------------- yankring
let g:yankring_replace_n_pkey = '<c-n>'
let g:yankring_replace_n_nkey = '<c-q>'


""" ------------- screenpaste
" screen paste normal mode only
nmap  <Leader>p  <Plug>ScreenpastePut		" Normal, Visual mode
nmap <Leader>P  <Plug>ScreenpastePutBefore	" Normal mode
" map! <Leader>p  <Plug>ScreenpastePut		" Insert, Command-line mode
" map  <Leader>gp <Plug>ScreenpasteGPut		" Normal, Visual mode
" some dummmy mappings!!!
map <Leader>xP1 <Plug>ScreenpasteGPutBefore	
map <Leader>xP2 <Plug>ScreenpasteGPut		

""" ------------------------------------------------------------
""" -------------------- debuging ------------------------------
""" ------------------------------------------------------------
if !has('python3')
py <<EOF

# def send_line(line):
#     'send line to screen'
#     c("call ScreenShellSend(%s)"%line)
# 
# def send_escape(s):
#     'escape line '
#     return "'"+s.replace("'", "''")+"'"
# 
# def send_text(txt):
#     'send lines to screen'
#     for l in filter(None, txt.split('\n')):
#         # print repr(l)
#         el = send_escape(l)
#         send_line(el)
import time

def find_buffer(filename):
    for b in vim.buffers:
        if b.name == filename:
            return b

def debug_loc(cmd=None):
    if cmd is not None:
        c('call ScreenShellSend("%s")'%cmd)
        time.sleep(0.01) # 10ms

    import vipdb
    filename, line = vipdb.get_location()
    # print repr(filename), repr(line)
    if filename is not None and not filename.endswith('.pyc') and filename.endswith('.py'):
        line = int(line)
        buf = find_buffer(filename)
        if buf is not None:
            # print 'buf found', buf.number, 'going', line
            if vim.current.buffer.number != buf.number:
                # print 'switching', buf.number
                c('buffer %s'%buf.number)
            c(str(line))
            # c('normal z.')
        else:
            # print 'tryin to open', filename, line
            c('edit +%i %s'%(line, filename))

EOF

endif
" go cOntinue
nmap go :py debug_loc('continue')<cr>
" go next
nmap gn :py debug_loc('next')<cr>
" go step (inside)
nmap gs :py debug_loc('step')<cr>
" nmap gu :py debug_loc('until')<cr>
nmap gr :py debug_loc('return')<cr>
" go location
nmap gl :py debug_loc()<cr>
" go up stack
nmap gu :py debug_loc('up')<cr>
" go bottom aka down stack
nmap gb :py debug_loc('down')<cr>
" go untIl 
nmap gi :py debug_loc('until')<cr>
nmap gj :call ScreenShellSend('jump ' . line('.'))<cr>
" nmap gc :call ScreenShellSend('continue')<cr>

let g:COMMAND_MAP = {
    \ "hit" : "echo 'HIT'",
    \ "ls current dir" : "ls",
    \ }


""" Autoformat autopep8 options
" aggressive added
" -a means --aggressive 
" -a, --aggressive      enable non-whitespace changes; multiple -a result in more aggressive changes
let g:formatprg_args_expr_python='"/dev/stdin ".(&textwidth ? "--max-line-length=".&textwidth : "")." -a -a"'


""" diff
set diffopt=filler,vertical

""" flake8 vim - F7 or L
let no_flake8_maps=1

""" syntastic
" uzyj ,L dla pylinta, ,l dla call Flake8 ,C-l dla SyntasticCheck
nmap <leader><C-l> :SyntasticCheck<Cr>
let g:syntastic_check_on_wq=0
let g:syntastic_quiet_warnings=0
let g:syntastic_mode_map = { 'mode': 'active' }
" tylko flake8 bo jest duzo duzo szybszy (dzieki pyflakes niz pylint)
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_always_populate_loc_list=1
" let g:syntastic_python_flake8_args="--config=setup.cfg"

"" Removes trailing spaces
function! TrimWhiteSpace() "{{{
    let cursor_pos = getpos('.')
    silent! %s/\s\+$//
    call setpos('.', cursor_pos)
endfunction "}}}

" nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>
nnoremap <Leader>xw :call TrimWhiteSpace()<CR><bar>:up<cr>

" screen focus change
nmap f<cr> :silent !screen -X focus<cr>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>

" encryption
set cryptmethod=blowfish

" distraction mode litedfm
nmap <leader>o :LiteDFMToggle<CR>
let g:lite_dfm_left_offset = 22

if has("gui_running")
    set mouse=a
    " for better scrolling when using the mouse
    " set scrolloff
    " Toolbar
    " set guioptions+=T 
endif

" i like mouse too much :p
set mouse=a
set scrolloff=6


let g:lite_dfm_normal_bg_cterm = 232
let g:lite_dfm_normal_bg_gui = '#abcabc'

" calculator, calc
" Then, just type 8*8<C-A> you will get 8*8 = 64
inoremap <C-A> <C-O>yiW<End> = <C-R>=<C-R>0<CR>
" or CTRL-R followed by = then, for example, 2+2 and press Enter.
"
"
""" paredit

let g:paredit_leader = ','
let g:paredit_disable_clojure = 1

""" clojure

"----------------------- Clojure mappings
function! ClojureMappings()
    nmap <buffer> gd [<C-D>
endfunction

" ------------------------ tagbar go
au FileType clojure call ClojureMappings()
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" let g:ctrlp_buftag_ctags_bin='/home/ppalucki/workspace/goprojects/bin/gotags'
"
"
let g:ctrlp_buftag_types = {
\ 'go' : {
  \ 'bin': 'ctags',
  \ 'args': '-f - --sort=no --excmd=pattern --fields=nKs --language-force=go',
  \ },
\ }



set lazyredraw


" godef
let g:godef_split=0
let g:godef_same_file_in_same_window=1


""" wymaga align
" sqlutils i sqluformatter
let g:sqlutil_align_comma = 1 " tnij po przecinku
let g:sqlutil_align_first_word = 1  
let g:sqlutil_align_keyword_right = 0 " wyrownaj keywords do prawej
let g:sqlutil_keyword_case = '\L' " zmieni wilkosc selectow
let g:sqlutil_align_where = 0 " w where = wartosc wyrownaj
let g:sqlutil_stmt_keywords = 'select,insert,update,delete,with,merge,join,limit,group,union,on'

" ignore all mappings from align plugn
let g:loaded_AlignMapsPlugin = "v42"


" convert timestamp ct
nmap <leader>ct yw:py import datetime;print datetime.datetime.fromtimestamp(<c-r>")<cr>

" python h
let g:syntastic_c_compiler_options = '-std=gnu99 `python-config --cflags --ldflags`'

" c mappngs
" clang
function CMappings()

    nmap <F9> :up<cr>:QuickRun<cr>
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    nmap gd <c-]>


endfunction

let g:clang_close_preview = 1

au FileType c call CMappings()

let g:quickrun_config = {}

let g:quickrun_config.c = {
      \ 'type': 'clang',
      \ 'cmdopt': '`python-config --cflags --ldflags`',
      \ 'exec': ['%c %s %o -o %s:p:r', '%s:p:r %a'],
      \ }
