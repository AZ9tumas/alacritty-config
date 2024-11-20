:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'tiagovla/tokyodark.nvim' " TokyoDark theme??
" Vim-Plug
Plug 'norcalli/nvim-colorizer.lua' " Colorizer-lua
Plug 'olimorris/onedarkpro.nvim'


call plug#end()

nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Use Enter to confirm completion when the popup menu is visible
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

colorscheme	onehalflight
