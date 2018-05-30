" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off                  " required

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" YCM
Plugin 'Valloric/YouCompleteMe'

" Ack
Plugin 'mileszs/ack.vim'

"Plugin 'bling/vim-bufferline'

" YANG
Bundle 'nathanalderson/yang.vim'

Bundle 'davidhalter/jedi-vim'

Bundle 'kien/ctrlp.vim'


Bundle 'Lokaltog/vim-easymotion'

Plugin 'scrooloose/nerdtree'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'dkprice/vim-easygrep'

Plugin 'fatih/vim-go'
"Plugin 'tagbar'
Plugin 'majutsushi/tagbar'

Plugin 'octol/vim-cpp-enhanced-highlight'

"minibufexp
"Plugin 'fholgado/minibufexpl'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
syntax enable
syntax on

colorscheme emacs
"set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

"set guifont=Consolas:h11:cANSI
"set guifont=Monospace\ Italic\ 12
set guifont=Consolas\ Italic:h16
"set lines=30 columns=120
set number
set encoding=utf-8
set fileencodings=gbk,utf-8,cp936,cp932
let &termencoding=&encoding
set nocp
set cindent

"for taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Compact_Format=1
let Tlist_Display_Prototype=0

"for winmanager
let g:winManagerWindowLayout='TagList'
let g:winManagerWidth = 40
nmap tm :WMToggle<cr>

":set cscopequickfix=s-,c-,d-,i-,t-,e-

"for new-omni-completion
filetype plugin indent on
set completeopt=longest,menu
"for supertab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"set mouse avaliable
set mouse=a
"set update time to 1ms
set updatetime=1

"minibufferExploer
"let g:miniBufExplMapWindowVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplModSelTarget=1

"TagHighlight settings
if ! exists('g:TagHighlightSettings')
	let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = 'tags'
let g:TagHighlightSettings['CtagsExecutable'] = 'ctags -N'
let g:TagHighlightSettings['ForcePythonVariant'] = 'if_pyth'
let g:TagHighlightSettings['PathToPython'] = '/bin/python'

"
"key mappings for each plugin
"
"for cscope
map <F2> "zyiw:exe ":cs find s ".@z.""<CR>
map <F3> "zyiw:exe ":cs find c ".@z.""<CR>
map <F4> "zyiw:exe ":cs find g arad_pp_".@z.""<CR>

"for split
nmap <F5> :split<cr>

"map <F7> :!cscope -RqvbU -I/home/richard/rgosm-build/prj_ca-octeon-cm/images/header -I/home/richard/rgosm-build/prj_ca-octeon-lc/images/header<CR>
map <F7> :!cscope -RqvbU<CR>

" for quickfix
map <F8> :cp<CR>
map <F9> :cn<CR>
"botright copen

autocmd FileType qf wincmd J

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunctio

"for buffers switch
map <F10> :bprev<CR>
map <F11> :bnext<CR>

let NERDTreeWinPos="right"
map <F12> :NERDTreeToggle<CR>
"�ر�vimʱ������򿪵��ļ�����NERDTreeû�������ļ�ʱ�����Զ��ر�
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"let NERDChristmasTree=1	"�������ÿ�,����û���ְ�

"tab instead 
set tabstop=4
set shiftwidth=4
set expandtab

"share clipboard with Xwindow system
set clipboard+=unnamed
set clipboard+=unnamedplus

set nobackup
set virtualedit=all
"set cursorline              " ͻ����ʾ��ǰ��
set ruler                   " ��״̬�����
"set autochdir               " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
"set ignorecase smartcase    " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set nowrap
"set nowrapscan              " ��ֹ���������ļ�����ʱ��������
set incsearch               " ������������ʱ����ʾ�������
set hlsearch                " ����ʱ������ʾ���ҵ����ı�
set guioptions-=T           " ���ع�����
set guioptions-=m           " ���ز˵���
set smartindent             " ��������ʱʹ�������Զ�����
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\                " ������״̬����ʾ����Ϣ

set scrolloff=3     " ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���

"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   ע�ʹ����õģ�
" [count],cc �������count���������ע��(7,cc)
" [count],cu �������count������ȡ��ע��(7,cu)
" [count],cm �������count�г�����ӿ�ע��(7,cm)
" ,cA ����β���� /* */,���ҽ������ģʽ�� ��������дע�͡�
" ע��count������ѡ������Ĭ��Ϊѡ���л�ǰ��
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " ��ע�ͷ������֮����һ���ո�
let NERDCompactSexyComs=1   " ����ע��ʱ���Ӹ��ÿ�

"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  ��ע�������ĵ��������ܹ��������ɺ�����׼ע��
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="chenhu@bmsoft.com.cn"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT><LEFT>

"if &diff                             " only for diff mode/vimdiff
"      set diffopt=filler,context:1000000 " filler is default and inserts empty lines for sync
"endif
"
let mapleader = ","
"Ack
map <leader>a :Ack!<space>
let g:ackhighlight=1
let g:ack_use_cword_for_empty_search = 1
let g:ack_qhandler = "botright copen 8"

"ag
let g:EasyGrepCommand=1
"set grepprg=ag\ --nogroup\ --nocolor
"set grepprg=ag\
map <leader>f :grep!<space>
let g:ag_qhandler = 'copen 10'
set grepprg=ag\ --vimgrep\ $*

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"augroup myvimrc
    "autocmd!
    "autocmd QuickFixCmdPost [^l]* cwindow
    "    autocmd QuickFixCmdPost l*    lwindow
"augroup END


map <leader>k :ccl<CR>
nnoremap ; :

set tags=tags;/

"tagbar
let Tlist_Ctags_Cmd = '/usr/local/bin/my_ctags'
let g:tagbar_ctags_bin='/usr/local/bin/my_ctags'
let tagbar_left=1
let g:tagbar_width=30
 "������tagbar�Ŀ�ݼ�����Ϊtb
"nmap tb :TagbarToggle<CR>
"nmap <Leader>t :TagbarToggle<CR>

" ��ĳЩ������Զ���tagbar
autocmd BufReadPost *.go,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"easy motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
nmap s <Plug>(easymotion-s)
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k


colorscheme molokai
"colorscheme desert


set cursorline

"golang
"complete
imap <C-k> <C-x><C-o>

"airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme='angr'
" tabline��buffer��ʾ���
let g:airline#extensions#tabline#buffer_nr_show = 1
" ʹ��powerline�������������
let g:airline_powerline_fonts = 1
" ӳ���л�buffer�ļ�λ
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nmap <c-m> :b#<cr>
" �鿴buffers
nnoremap <Leader>l :ls<CR>
" ӳ��<leader>num��num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

set autowrite
"location list in quickfix
let g:go_list_type = "quickfix"
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_fmt_command = "goimports"

autocmd FileType go nmap gi <Plug>(go-info)
autocmd FileType go nmap gr <Plug>(go-referrers)
" :GoDef but opens in a horizontal split
autocmd FileType go nmap gs <Plug>(go-def-split)
" :GoDoc
autocmd FileType go nmap gf <Plug>(go-doc)
" :GoDescribe
autocmd FileType go nmap gb <Plug>(go-describe)

"let g:go_auto_sameids = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1



" insert mode shortcut
imap <c-a> <ESC>I
imap <c-e> <ESC>A
imap <c-h> <Left>
imap <c-l> <Right>
"imap <c-k> <Up>
"imap <c-j> <Down>
imap <c-d> <Delete>

nnoremap [p "0p

""""""""""
"  SET   "
""""""""""
set showcmd


"�������
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

map <leader>h :nohls<CR>
map <leader>p :pwd<CR>

autocmd FileType html setlocal et sta sw=2 sts=2

" ��ɫ
" ��������
"hi DiffAdd    ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
" �仯����
"hi DiffChange ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
" ɾ������
"hi DiffDelete ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
" �仯������
"hi DiffText   ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse


