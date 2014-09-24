if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
syn on

let g:LustyJugglerSuppressRubyWarning = 1
let g:pymode_lint_ignore = "C0321,W0702,C0301,I0011"
" Necesary for lots of cool vim things
set nocompatible

set number
set ruler
set et
" set smarttab
set softtabstop=4
set shiftwidth=4 
set expandtab 
" filetype indent on
map <f2> :w\|!python %<cr>
" split window stuff
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" \c \u to comment/uncomment code block
vmap \c :s!^!//!<CR>
vmap \u :s!^//!!<CR>

filetype plugin indent on

" makes cursor not jump back when switching modes
inoremap jj <Esc>`^ 

" alt mouse click to move cursor
set mouse=""

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

set history=700
set undolevels=700

set hidden

" automatically reload vimrc
au BufWritePost .vimrc so ~/.vimrc

" for folds
"augroup vimrc
" au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END


autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

hi Folded ctermfg=216 ctermbg=0

" python vim ide
" http://www.youtube.com/watch?v=YhqsjUUHj6g&feature=related
" 
"set runtimepath+=~/.vim/autoload
"call pathogen#infect()

set laststatus=2 " Always show the statusline
set t_Co=256 " Explicitly tell vim that the terminal has 256 colors

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
" to install:
" :BundleInstall
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'klen/python-mode'
Bundle 'mbadran/headlights'
" ============================================================================
" " Python IDE Setup
" "
" ============================================================================
"
" " Settings for vim-powerline
" " cd ~/.vim/bundle
" " git clone git://github.com/Lokaltog/vim-powerline.git
" "" set laststatus=2
"
"
" " Settings for ctrlp
" " cd ~/.vim/bundle
" " git clone https://github.com/kien/ctrlp.vim.git
" ""let g:ctrlp_max_height = 30
" "" set wildignore+=*.pyc
" "" set wildignore+=*_build/*
" "" set wildignore+=*/coverage/*
"
"
" " Settings for python-mode
" " cd ~/.vim/bundle
" " git clone https://github.com/klen/python-mode
" "" map <Leader>g :call RopeGotoDefinition()<CR>
" "" let ropevim_enable_shortcuts = 1
" "" let g:pymode_rope_goto_def_newwin = "vnew"
" "" let g:pymode_rope_extended_complete = 1
" "" let g:pymode_breakpoint = 0
" "" let g:pymode_syntax = 1
" "" let g:pymode_syntax_builtin_objs = 0
" "" let g:pymode_syntax_builtin_funcs = 0
" "" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
" " Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" "" set completeopt=longest,menuone
" "" function! OmniPopup(action)
" ""     if pumvisible()
" ""         if a:action == 'j'
" ""             return "\<C-N>"
" ""         elseif a:action == 'k'
" ""             return "\<C-P>"
" ""         endif
" ""     endif
" ""     return a:action
" "" endfunction
"
" "" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" "" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
