" <<<---Skyxer's GVim .vimrc--->>>
" INSTALLED PLUGINS
" Airline (https://github.com/bling/vim-airline)
" NERDTree (https://github.com/scrooloose/nerdtree)
" <COLORSCHEMES>
" - kolor (https://github.com/zeis/vim-kolor)
" - candy (http://www.vim.org/scripts/script.php?script_id=282)

" <<--Global Settings-->>
set noerrorbells visualbell t_vb=           "Prevent screen flashing from errors
autocmd GUIEnter * set visualbell t_vb=     "Prevent screen flashing from errors
colorscheme kolor                           "Set Vim colorscheme as kolor
let g:airline_theme = 'kolor'               "Set Airline theme as kolor
set tabstop=4                               "Set how many columns is a TAB
set shiftwidth=4                            "Set how many columns is identation
set softtabstop=4                           "Set how many columns is a TAB in Insert Mode
set expandtab                               "TAB in insert is the set number of columns
set smarttab                                "<Tab> in front of a line inserts blank set columns
set hidden                                  "Buffer unloaded on abandon
set autowriteall                            "Save file on buffer switch
set wildmenu                                "Autcomplete on status line 
set showcmd                                 "Show complete command
set hlsearch                                "Highlight search
set nomodeline                              "Disable modeline variables
set ignorecase                              "Ignore Upper/Lower case differences
set smartcase                               "Check for Upper/Lower if search contains either
set backspace=indent,eol,start              "Move using Backspace
set autoindent                              "Automatic Indentation
set nostartofline                           "Prevent column change on line jump
set ruler                                   "Shows ruler for the cursor
set laststatus=2                            "Always show statusline
set confirm                                 "Ask for command confirmation
set mouse=a                                 "Enable (all) mouse commands
set cmdheight=1                             "Size of command line
set number                                  "Show line Numbers
set notimeout ttimeout ttimeoutlen=200      "Set timeou period 
map Y y$                                    "Make Y effect to end of line instead of whole line

"<<--Mappings-->>
nnoremap <C-L> :nohl<CR><C-L>

"<<--Interface Settings-->> 
set encoding=utf8
if has("gui_running")
  au GUIEnter * simalt ~x
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")i
    set guifont=Inconsolata_for_Powerline:h12
    cd ~/documents    
  endif
endif

"<<--Airline Settings-->>
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"<<--NERDTree Settings-->>
autocmd VimEnter * NERDTree
let NERDTreeShowBookmarks=1
map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTree %:p:h<CR>
"SYNTAXES
autocmd BufRead,BufNewFile *.as set filetype=as3
autocmd BufRead,BufNewFile *.hx set filetype=haxe

"<<--GVim to Vim Settings-->>
set guioptions-=m "Menu Bar
set guioptions-=l 
set guioptions-=L 
set guioptions-=
set guioptions-=R 
set guioptions-=T 


"<<--GVim-Only Settings-->>
if has("gui_running")
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
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
endif
