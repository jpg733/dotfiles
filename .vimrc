execute pathogen#infect()
	"  General Config 
set backspace=indent,eol,start "Allow backspace in insert mode
set history=1000 "Store lots of :cmdline history
set showcmd "Show incomplete cmds down the bottom
set showmode "Show current mode down the bottom
set visualbell "No sounds
set autoread "Reload files changed outside vim

	"set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible

	"Tab settings
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
"set noexpandtab
"set autoindent
set smartindent 
set cindent

	"Syntax higlihgting color scheme
syntax on
colorscheme brogrammer
colorscheme darkblue
set t_Co=256

"set background=dark
set textwidth=80
set scrolloff=5
set number
set relativenumber
set mouse=a
set showmatch
set comments=sl:/*,mb:\*,elx:\*/

"syntax for .conf
au BufEnter,BufRead *.conf setf dosini

	" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"#############Remappings#############
	" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

nnoremap Q @q
vnoremap Q :norm @q<cr>

	"copy paragraph
noremap cp yap<S-}>p

	" EITHER blink the line containing the match...
    function! HLNext (blinktime)
        set invcursorline
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        set invcursorline
        redraw
    endfunction

	"Make tab and trailing spaces visble
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

	" autoremove trailing whitespace
autocmd FileType tex,c,cpp,java,php,pl,html autocmd BufWritePre <buffer> :%s/\s\+$//e
	"write vimrc
autocmd! BufwritePost $MYVIMRC source $MYVIMRC

	"  Persistent Undo 
	" Keep undo history across sessions, by storing in file.
	" Only works all the time.
if has('persistent_undo')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" Remvoe silly temp files 
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

