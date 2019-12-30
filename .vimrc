if has('python3')
  silent! python3 1
endif

filetype off        
set fileencodings=utf-8


set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent


autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal omnifunc=tern#Complete

autocmd FileType css setlocal ts=2 sw=2 expandtab

autocmd FileType cs setlocal ts=2 sw=2 expandtab
autocmd FileType cs setlocal omnifunc=tern#Complete

autocmd FileType typescript setlocal ts=2 sw=2 expandtab
autocmd FileType typescript :set makeprg=tsc
autocmd FileType typescript setlocal omnifunc=tern#Complete
au BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

au BufNewFile,BufRead *.swift setlocal ts=2 sw=2 expandtab filetype=swift


set backspace=indent,eol,start

set ruler
set showcmd

if has("syntax")
	syntax on
endif

set nu
set hlsearch
set showmatch

set ignorecase


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

Plugin 'leafgarland/typescript-vim'

"swift syntax
Plugin 'file:///Users/vovo/Documents/personalstudy/backjoonMySolving/swift/swift', {'rtp': 'utils/vim/', 'name':'Swift-Syntax'}

Plugin 'nanotech/jellybeans.vim'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar' " when you type - in your diretory its very useful

Plugin 'vim-syntastic/syntastic'
Plugin 'Yggdroot/indentLine' " show tab lines

Plugin 'Raimondi/delimitMate' " gualho dat

Plugin 'ctrlp.vim' "serach file 

Plugin 'davidhalter/jedi-vim'
" Plugin 'lambdalisue/vim-pyenv' "jedi vim to use"

Plugin 'ervandew/supertab' "javascript autocomplete and snippet is very important supertab
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Quramy/tsuquyomi'

call vundle#end()            " required
filetype plugin indent on    " required

autocmd FileType python setlocal completeopt-=preview

if !exists("g:ycm_semantic_triggers")
      let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers['typescript'] = ['.']

" enhance YCM JS completion with tern's smarts

let g:SuperTabClosePreviewOnPopupClose = 1

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let delimitMate_expand_cr=1


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["html"] }

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-y>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


color jellybeans

map <Leader>nt <ESC>:NERDTree<CR>
map <Leader>t <ESC>:tabnew<SPACE>
map <Leader>q <ESC>:wq<CR>

"tab number show
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

set showtabline=1
" }}}
" MyTabLine {{{
" This is an attempt to emulate the default Vim-7 tabs as closely as possible but with numbered tabs.

if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
      " set up some oft-used variables
      let tab = i + 1 " range() starts at 0
      let winnr = tabpagewinnr(tab) " gets current window of current tab
      let buflist = tabpagebuflist(tab) " list of buffers associated with the windows in the current tab
      let bufnr = buflist[winnr - 1] " current buffer number
      let bufname = bufname(bufnr) " gets the name of the current buffer in the current window of the current tab

      let s .= '%' . tab . 'T' " start a tab
      let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#') " if this tab is the current tab...set the right highlighting
      let s .= ' ' . tab " current tab number
      let n = tabpagewinnr(tab,'$') " get the number of windows in the current tab
      if n > 1
        let s .= ':' . n " if there's more than one, add a colon and display the count
      endif
      let bufmodified = getbufvar(bufnr, "&mod")
      if bufmodified
        let s .= ' +'
      endif
      if bufname != ''
        let s .= ' ' . pathshorten(bufname) . ' ' " outputs the one-letter-path shorthand & filename
      else
        let s .= ' [No Name] '
      endif
    endfor
    let s .= '%#TabLineFill#' " blank highlighting between the tabs and the righthand close 'X'
    let s .= '%T' " resets tab page number?
    let s .= '%=' " seperate left-aligned from right-aligned
    let s .= '%#TabLine#' " set highlight for the 'X' below
    let s .= '%999XX' " places an 'X' at the far-right
    return s
  endfunction
  set tabline=%!MyTabLine()
endif


"map <Leader>c :w <CR> :!g++ -std=c++11 % -o %<.out && ./%<.out<CR>
map <Leader>p :w <CR> :!python ./%<.py <CR>
map <Leader>j :w !node<CR>
map <Leader>k :w <CR>:!javac ./%<.java<CR>:!java %<<CR>
map <Leader>c :w<CR>:!dotnet run<CR>
map <Leader>o :w !pbcopy<CR>
map <Leader>w :w<CR>:!swift %<.swift<CR>

"let g:prettier#autoformat = 0 " prettier 자동 적용 활성화
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.md,*.vue, PrettierAsync


set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"ctrlp set working dir path
let g:ctrlp_working_path_mode='a'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']

let g:vue_disable_pre_processors=1

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'


