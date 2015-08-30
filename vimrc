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
Plugin 'justmao945/vim-clang' " Clang Completion
Plugin 'Shougo/neocomplete' " Code Completion

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

" autocompletion



	        " disable auto completion forr vim-clang
        let g:clang_auto = 0
        " default 'longest' can not work with neocomplete
        let g:clang_c_completeopt = 'menuone,preview'
        let g:clang_cpp_completeopt = 'menuone,preview'
        
        " use neocomplete
        " input patterns
        if !exists('g:neocomplete#force_omni_input_patterns')
          let g:neocomplete#force_omni_input_patterns = {}
	  endif
        
        " for c and c++
        let g:neocomplete#force_omni_input_patterns.c =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
		let g:neocomplete#force_omni_input_patterns.cpp =
              \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'



" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword. language
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'







" Backup system
set nobackup
set nowritebackup
set noundofile

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
