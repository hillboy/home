filetype plugin on
set ofu=syntaxcomplete#Complete

set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
syntax on
set scrolloff=2
set ignorecase
set smartcase
set number
set incsearch
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
source ~/.vim/c.vim
:set completeopt=longest,menuone

fun! PullAndRefresh()
  set noconfirm
  bufdo e!
  set confirm
endfun

nmap <leader>gr call PullAndRefresh()
nnoremap ,n :cn <cr>
nnoremap ,N :cN <cr>
nnoremap <expr> ,p ':pu ' . v:register . '<cr>'
nnoremap <expr> ,P ':pu! ' . v:register . '<cr>'
au FileType cpp set makeprg=g++\ %
au FileType go set makeprg=go\ build\ -o\ a.out\ %
nnoremap <F7> :make <cr>
nnoremap <F5> :!./a.out<a.txt <cr>
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
set nowrap
set clipboard=unnamedplus

" cursorline settings
" set cursorline
" only highlight the CursorLine in current windows:
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set autochdir
set formatoptions-=tc

" Requires $BROWSER being set as an environment variable
function! Browser ()
  let line = getline (".")
  let line = matchstr (line, "\(\(ht\|f\)tp:\/\/\.*\)\s")
"  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
  :if line==""
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ ]*")
  :endif
  :if line==""
  let line = matchstr (line0, "ftp[^ ]*")
  :endif
  :if line==""
  let line = matchstr (line0, "file[^ ]*")
  :endif
  echom "".line
  exec "!$BROWSER \"".line."\""
endfunction
map <Leader>w :call Browser ()<CR>
map <Leader>sa :wall <CR>
map <Leader>ss :w <CR>
map <Leader>q :qall <CR>

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
hi Folded ctermfg=NONE ctermbg=NONE
nnoremap <space> za

" MiniBufExpl Colors
"hi MBEVisibleActive guifg=#A6DB29 guibg=fg
"hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
"hi MBEVisibleChanged guifg=#F1266F guibg=fg
"hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
"hi MBEChanged guifg=#CD5907 guibg=fg
"hi MBENormal guifg=#808080 guibg=fg
" customized minibufexpl comes from : https://github.com/fholgado/minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1

