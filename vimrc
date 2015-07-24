set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

colorscheme badwolf
highlight LineNr guibg=#252421
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Vundle Plugin Manager
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Vundle /Required

Plugin 'scrooloose/nerdtree.git' " File Browser
Plugin 'Chiel92/vim-autoformat' " Code Formatting
"Plugin 'Valloric/YouCompleteMe' " Code Completion

call vundle#end()
filetype plugin indent on  

" Key Bindings
" Normal Mode 
nmap <C-D> :NERDTreeToggle<CR>
nmap <C-S-F> :Autoformat<CR>
nmap <A-Up> :m .-2<cr>==
nmap <A-Down> :m .+1<cr>==

" Insert Mode
imap <C-D> <C-O>:NERDTreeToggle<CR>
imap <C-S-F> <C-O>:Autoformat<CR>
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <A-Down> <Esc>:m .+1<CR>==gi

" autoformat Configuration

" Backup system
set nobackup
set nowritebackup

" Font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas\ 11
  elseif has("gui_macvim")
    set guifont=Consolas\ Regular:h11
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Statusbar style
set laststatus=2                      " Always show statusbar

set statusline=
set statusline+=%1*\ [%n]\                " Buffer number
set statusline+=%2*                      " Separator


" Separator
set statusline+=%3*\ %<%1{getcwd()}\      " Path
set statusline+=%4*                      " Separator
" Separator
set statusline+=%5*\ %<%{expand('%')}\ %= " Filename
set statusline+=%4*                      " Separator
set statusline+=%3*\ LINE:\ %l/%L\        " Rownumber/total
set statusline+=%2*                      " Separator
set statusline+=%1*\ COL:\ %c\            " Column
set statusline+=%0*\ \ %m%r%w\ %P\ \      " Modified? Readonly? Top/bot.
set statusline+=%9*\ %y\                  " File type
set statusline+=%9*\%{&spelllang}\        " Spel language

hi User0 guifg=#ffffff  guibg=#094afe  gui=bold
hi User1 guifg=#ffffff  guibg=#1b3f7b
hi User2 guifg=#1b3f7b  guibg=#5b7fbb
hi User3 guifg=#ffffff  guibg=#5b7fbb
hi User4 guifg=#5b7fbb  guibg=#ffffff
hi User5 guifg=#1b3f7b  guibg=#ffffff
hi User9 guifg=#ffffff  guibg=#000000  gui=bold    

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

