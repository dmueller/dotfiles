set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

" dunno what these do
" set lbr
" set tw=500

syntax enable
set background=dark
"colorscheme solarized

set hlsearch " highlight searched words

"""" sections from http://amix.dk/vim/vimrc.html
set ruler "Always show current position

set cmdheight=1 "The commandbar height

set ignorecase "Ignore case when searching

set ai "Auto indent
set si "Smart indet

" not sure what these do
"" => Parenthesis/bracket expanding
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a"<esc>`<i"<esc>
" 
"" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i
" inoremap $t <><esc>i

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""" end of sections from amix.dk

" use F2 key to toggle paste mode -- which will disable automatic formatting of pasted text.
" this prevents the sloping indents of a paste from the clipboard
set pastetoggle=<F2>

" Blue is hard to read on the black, so let's make them Cyan
highlight SpecialKey ctermfg=Cyan
highlight NonText ctermfg=Cyan
highlight PreProc ctermfg=6
highlight PreProc cterm=bold
highlight Underlined ctermfg=6
highlight Comment cterm=reverse

" make adp files count as html for syntax hilighting
au BufRead,BufNewFile *.adp setfiletype html

