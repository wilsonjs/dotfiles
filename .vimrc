set nocompatible              "For using the latest Vim settings/options

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start "Make backspace work
let mapleader = ','            "Change default leader from \ to a comma
set number                     "Display line numbers
set noerrorbells visualbell t_vb=



"-----------Visuals-----------
" colorscheme molokai
set background=dark
let g:solarized_termcolors=256
colorscheme wombat

let g:one_allow_italics = 1     "Italic for comments

set t_CO=256
set guifont=Menlo:h14
" set guioptions-=e           "Disables GUI tabs

set linespace=8               "Macvim-specific line-height
set tabstop=2                  "Set tab to 2 spaces
set expandtab									 "Set tab to spaces
set softtabstop=2
set shiftwidth=2               "for when indenting with '>', use 2 spaces width
set clipboard=unnamed          "Be able to use normal copy/paste on Visual and Normal mode
"set noexpandtab                "No expand tabs

"Remove scroll bar for non vertical split and vertical split window
set guioptions=l
set guioptions=L
set guioptions=r
set guioptions=R

"Line number background same as editor bg
hi LineNr guibg=bg
"Removes split border
hi vertsplit guifg=bg guifg=bg


"-----------Searching-----------
set hlsearch
set incsearch



"--------Split Management--------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"------------Mappings------------

"Make it easy to edit Vimrc file, 
"nmap - means normal mode
"<cr> - means carriage return
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <D-1> :NERDTreeToggle<cr>
nmap <D-r> :NERDTreeFind<cr>

"Resize tabs horizontally by 10%
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 11/10)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 9/10)<CR>

"Resize tabs vertically by 10%
nnoremap <silent> <Leader>v= :exe "vertical resize " . (winwidth(0) * 11/10)<CR>
nnoremap <silent> <Leader>v- :exe "vertical resize " . (winwidth(0) * 9/10)<CR>



"-------------Plugins------------

"\
"\ CtrlP
"\
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'order:ttb,min:1,max:20'
"Browse symbols (vars, fns, classes, etc)
"nmap <c-r> :CtrlPBufTag<cr>
"Browse most recent files
nmap <c-e> :CtrlPMRUFiles<cr>


"\
"\ vim jsx 
"\
let g:vim_jsx_pretty_colorful_config = 1 " default 0

"\
"\ NERDTree
"\
let NERDTreeHijackNetrw = 0

"\
"\ Greplace.vim
"\
set grepprg=ag                                       "Use Ag for the search
let g:grep_cmd_opts = '--line-numbers --noheading'


"----------Auto-Commands---------

"Auto source vimrc file on save

augroup autosouring
	autocmd!
	autocmd BufwritePost .vimrc source %
augroup END