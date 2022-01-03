call plug#begin('~/.nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'luochen1990/rainbow'
if has('nvim')
  Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'gelguy/wilder.nvim'
endif

call plug#end()

" General Config
set mouse=a

" Plugin Config
" NERDTree
let NERDTreeShowHidden=1

" lualine
lua << END
require('lualine').setup()
END

" wilder
call wilder#setup({'modes': [':', '/', '?']})

" rainbow brackets
let g:rainbow_active = 1
