" VIM Configuration - Vincent Jousse
" Annule la compatibilite avec l'ancetre Vi : totalement indispensable
set nocompatible

" -- Affichage
set title                 " Met a jour le titre de votre fenetre ou de
                          " votre terminal
set number                " Affiche le numero des lignes
set ruler                 " Affiche la position actuelle du curseur
set wrap                  " Affiche les lignes trop longues sur plusieurs
                          " lignes

set scrolloff=3           " Affiche un minimum de 3 lignes autour du curseur
                          " (pour le scroll)

" -- Recherche
set ignorecase            " Ignore la casse lors d'une recherche
set smartcase             " Si une recherche contient une majuscule,
                          " re-active la sensibilite a la casse
set incsearch             " Surligne les resultats de recherche pendant la
                          " saisie
set hlsearch              " Surligne les resultats de recherche

" -- Beep
set visualbell            " Empeche Vim de beeper

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set noerrorbells          " Empeche Vim de beeper
set belloff=all
" Active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l'ouverture d'autres fichiers
set hidden
syntax enable

filetype on
filetype plugin on
filetype indent on

" Desactiver les touches directionnelles
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
"Installation automatig de vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'flrnprz/candid.vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim' " {'as': 'onedark'}
Plug 'sheerun/vim-polyglot'
call plug#end()

set background=dark

syntax on
colorscheme onedark

if (has("termguicolors"))
  set termguicolors
endif

hi Normal guibg=NONE ctermbg=NONE

map <C-o> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set smartindent
:set autoindent

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
