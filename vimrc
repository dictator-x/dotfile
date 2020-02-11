" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.0+ and expects you to have Plug installed.
" -----------------------------------------------------------------------------
" ln vimrc ~/.vimrc
" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" load plugins from vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

" Gruvbox theme.
Plugin 'gruvbox-community/gruvbox'

" Integrate fzf with Vim.
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'


" Better manage Vim sessions.
Plugin 'tpope/vim-obsession'

" Zoom in and out of a specific split pane (similar to tmux).
Plugin 'dhruvasagar/vim-zoom'

" Pass focus events from tmux to Vim (useful for autoread and linting tools).
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Navigate and manipulate files in a tree view.
Plugin 'scrooloose/nerdtree'

" Launch Ranger from Vim.
Plugin 'francoiscabrol/ranger.vim'

" Run a diff on 2 directories.
Plugin 'will133/vim-dirdiff'

" Run a diff on 2 blocks of text.
Plugin 'AndrewRadev/linediff.vim'

" Add spelling errors to the quickfix list (vim-ingo-library is a dependency).
Plugin 'inkarkat/vim-ingo-library' | Plugin 'inkarkat/vim-SpellCheck'

" Modify * to also work with visual selections.
Plugin 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plugin 'haya14busa/is.vim'

" Handle multi-file find and replace.
Plugin 'mhinz/vim-grepper'

" Better display unwanted whitespace.
Plugin 'ntpeters/vim-better-whitespace'

" Toggle comments in various ways.
Plugin 'tpope/vim-commentary'

" Surround text with quotes, parenthesis, brackets, and more.
Plugin 'tpope/vim-surround'

" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plugin 'tpope/vim-sleuth'

" A number of useful motions for the quickfix list, pasting and more.
Plugin 'tpope/vim-unimpaired'

" Drastically improve insert mode performance in files with folds.
Plugin 'Konfekt/FastFold'

" Show git file changes in the gutter.
Plugin 'mhinz/vim-signify'

" A git wrapper.
Plugin 'tpope/vim-fugitive'

" Dim paragraphs above and below the active paragraph.
Plugin 'junegunn/limelight.vim'

" Distraction free writing by removing UI elements and centering everything.
Plugin 'junegunn/goyo.vim'

" A bunch of useful language related snippets (ultisnips is the engine).
Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets'

" Run test suites for various languages.
Plugin 'janko/vim-test'

" Vim status bar.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Bracket auto pair.
Plugin 'jiangmiao/auto-pairs'

" Integrate The Silver Searcher.
Plugin 'mileszs/ack.vim'

" Indent guides.
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Yggdroot/indentLine'

" Highlight
Plugin 'vim-scripts/cSyntaxAfter'

" Languages and file types.
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chr4/nginx.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'elzr/vim-json'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'godlygeek/tabular' | Plugin 'tpope/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plugin 'lifepillar/pgsql.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'stephpy/vim-yaml'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-rails'
Plugin 'vim-python/python-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wgwoods/vim-systemd-syntax'

Plugin 'itchyny/vim-cursorword'
Plugin 'miyakogi/conoline.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-eunuch'
" Plugin 'kien/ctrlp.vim'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'magic-dot-files/TagHighlight'
Plugin 'uiiaoo/java-syntax.vim'
" Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'sheerun/vim-polyglot'

" Read java class file
Plugin 'udalov/javap-vim'

" Plugin for Golang
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

colorscheme gruvbox
" For Gruvbox to look correct in terminal Vim you'll want to source a palette
" script that comes with the Gruvbox plugin.
"
" Add this to your ~/.profile file:
"   source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

" Gruvbox comes with both a dark and light theme.
set background=dark

" Gruvbox has 'hard', 'medium' (default) and 'soft' contrast options.
let g:gruvbox_contrast_light='hard'

" This needs to come last, otherwise the colors aren't correct.
syntax on

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
"cfunction! s:statusline_expr()
"   let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"   let ro  = "%{&readonly ? '[RO] ' : ''}"
"   let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"   let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"   let sep = ' %= '
"   let pos = ' %-12(%l : %c%V%) '
"   let pct = ' %P'

"   return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
" endfunction

" let &statusline = s:statusline_expr()

" -----------------------------------------------------------------------------
" Change status line color for insert and replace modes
" -----------------------------------------------------------------------------

" Optimized for gruvbox:hard (both dark and light).
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    if (&background == 'dark')
      hi StatusLine ctermfg=109 ctermbg=0 guifg=#83a598 guibg=#000000
    else
      hi StatusLine ctermfg=24 ctermbg=255 guifg=#076678 guibg=#ffffff
    endif
  elseif a:mode == 'r'
    if (&background == 'dark')
      hi StatusLine ctermfg=106 ctermbg=0 guifg=#98971a guibg=#000000
    else
      hi StatusLine ctermfg=100 ctermbg=255 guifg=#79740e guibg=#ffffff
    endif
  else
    if (&background == 'dark')
      hi StatusLine ctermfg=166 ctermbg=0 guifg=#d65d0e guibg=#000000
    else
      hi StatusLine ctermfg=88 ctermbg=255 guifg=#9d0006 guibg=#ffffff
    endif
  endif
endfunction

function! InsertLeaveActions()
  if (&background == 'dark')
    au InsertLeave * hi StatusLine ctermfg=239 ctermbg=223 guifg=#504945 guibg=#ebdbb2
  else
    au InsertLeave * hi StatusLine ctermfg=250 ctermbg=0 guifg=#d5c4a1 guibg=#000000
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" Ensure status line color gets reverted if exiting insert mode with CTRL + C.
inoremap <C-c> <C-o>:call InsertLeaveActions()<CR><C-c>

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader=","
let maplocalleader=","

" set swapfile
" set dir=~/.swap-files
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=/tmp//,.
" set clipboard=unnamedplus
set colorcolumn=80
set complete-=i
set completeopt=menuone,preview
set cryptmethod=blowfish2
set directory=/tmp//,.
set encoding=utf-8
set expandtab
set smarttab
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set matchpairs+=<:> " Use % to jump between pairs
set modelines=2
set mouse=a
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number relativenumber
set regexpengine=1
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set ttimeout
set ttyfast
set ttymouse=sgr
set undodir=/tmp//,.
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
" set nowrap
set tw=79
set linebreak
set showbreak=↪\
set list
set listchars=tab:\ \ ,eol:⤦

runtime! macros/matchit.vim

" -----------------------------------------------------------------------------
" Font
" -----------------------------------------------------------------------------

set guifont=FiraCode_Nerd_Font:h14

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
" nnoremap <S-Tab> <C-w>w

" Tab navigation like Firefox.
" nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <S-Tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <S-Tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> <Leader>d :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> <Leader>d "sy:let @/=@s<CR>cgn

" Clear search highlights.
map <Leader><Space> :let @/=''<CR>

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>g gqap
xnoremap <Leader>g gqa

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" Eliminate issues where you accidentally hold shift for too long with :w.
command! W write

" Toggle spell check.
map <F5> :setlocal spell!<CR>

" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>

" Convert the selected text's title case using the external tcc script.
"   Requires: https://github.com/nickjj/title-case-converter
vnoremap <Leader>tc c<C-r>=system('tcc', getreg('"'))[:-2]<CR>

" Copy to clipboard
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P

" Cusor change
" :autocmd InsertEnter * set cul
" :autocmd InsertLeave * set nocul

" Cusor chang for iTerm.
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
"-----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Reduce delay when switching between modes.
" augroup NoInsertKeycodes
"   autocmd!
"   autocmd InsertEnter * set ttimeoutlen=0
"   autocmd InsertLeave * set ttimeoutlen=500
" augroup END

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set syntax=python

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" ----------------------------------------------------------------------------
" Basic commands
" ----------------------------------------------------------------------------

" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction

command! Todo call s:todo()

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction

command! -bang Profile call s:profile(<bang>0)

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :Files<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

" Preview window for Files.
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always {}']}, <bang>0)

" Preview window for GFiles.
command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always {}']}, <bang>0)

" Preview window for Rg.
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --no-ignore-vcs --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let g:ackprg = 'ag --vimgrep'
let g:ag_working_path_mode="r"
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" .............................................................................
" scrooloose/nerdtree
" .............................................................................

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" .............................................................................
" ntpeters/vim-better-whitespace
" .............................................................................

let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1

" .............................................................................
" Konfekt/FastFold
" .............................................................................

let g:fastfold_savehook=0
let g:fastfold_fold_command_suffixes=[]

" .............................................................................
" junegunn/limelight.vim
" .............................................................................

let g:limelight_conceal_ctermfg=244

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/nick/.local/lib/github-markdown-css/github-markdown.css'

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/nick/.local/lib/github-markdown-css/github-markdown.css'

" -----------------------------------------------------------------------------
" Self define function
" -----------------------------------------------------------------------------

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" -----------------------------------------------------------------------------
" Airline
" -----------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" function! AirlineInit()
"   let g:airline_section_a = airline#section#create(['mode',' ','branch'])
"   let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
"   let g:airline_section_c = airline#section#create(['filetype'])
"   let g:airline_section_x = airline#section#create(['%P'])
"   let g:airline_section_y = airline#section#create(['%B'])
"   let g:airline_section_z = airline#section#create_right(['%l','%c'])
" endfunction
" call AirlineInit()
"
" -----------------------------------------------------------------------------
" nathanaelkane/vim-indent-guides
" -----------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
" let g:indentLine_color_gui = '#A4E57E'

" -----------------------------------------------------------------------------
" cSyntaxAfter
" -----------------------------------------------------------------------------
" autocmd! FileType c,cpp,java,php call CSyntaxAfter()
autocmd! FileType c,cpp,php call CSyntaxAfter()
" -----------------------------------------------------------------------------
" miyakogi/conoline.vim
" -----------------------------------------------------------------------------
let g:conoline_auto_enable = 1
" -----------------------------------------------------------------------------
" kien/rainbow_parentheses.vim
" -----------------------------------------------------------------------------
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" -----------------------------------------------------------------------------
" vim-airline/vim-airline-themes
" -----------------------------------------------------------------------------
let g:airline_theme='simple'

" -----------------------------------------------------------------------------
" mileszs/ack.vim
" -----------------------------------------------------------------------------
nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <Leader>A :tab split<CR>:Ack <C-r><C-w><CR>
xmap <Leader>A :tab split<CR>:Ack ""<Left><CR>

" -----------------------------------------------------------------------------
" kien/ctrlp.vim
" -----------------------------------------------------------------------------
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = ''
" let g:ctrlp_working_path_mode = 0
"-----------------------------------------------------------------------------
" Useful command
" -----------------------------------------------------------------------------
" retab to 2
" :set ts=2 sts=2 noet
" :retab!
"
" retab to 4
" :set ts=4 sts=4 et
" :retab

" -----------------------------------------------------------------------------
" vim-syntastic/syntastic
" -----------------------------------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" -----------------------------------------------------------------------------
" sheerun/vim-polyglot
" -----------------------------------------------------------------------------
let g:python_highlight_all = 1
