call plug#begin('~/.local/share/nvim/plugged')

Plug 'rhysd/vim-clang-format'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'

Plug 'ruanyl/vim-gh-line'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

Plug 'BurntSushi/ripgrep'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-dispatch'

Plug 'cdonovick/python-syntax'
let g:polyglot_disabled = ['latex']
Plug 'sheerun/vim-polyglot'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'mhinz/neovim-remote'

Plug 'lervag/vimtex'

Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nlknguyen/papercolor-theme'

call plug#end()

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

require'lspconfig'.pylsp.setup{}
EOF

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
  autocmd FileType gitcommit set bufhidden=delete
endif

set termguicolors
set fillchars+=vert:│
" let g:tokyonight_style = 'storm'
" let g:tokyonight_enable_italic = 1

" colorscheme tokyonight
" hi! Normal ctermbg=NONE guibg=NONE
" let g:airline_theme = 'tokyonight'

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 0
  \     }
  \   }
  \ }
let g:airline_theme = 'papercolor'
colorscheme PaperColor
set background=light

let g:python_version_2 = 0
let g:python_highlight_all = 1

set number

set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start

set history=1000
set backup
set noswapfile

set backupdir=~/.nvim/tmp/backup/
set directory=~/.nvim/tmp/swap/

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

if has('persistent_undo')
  set undofile
  set undoreload=10000
  set undodir=~/.nvim/tmp/undo/     " undo files
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif


set autoindent
set smartindent

set incsearch
set ignorecase
set smartcase

set noshowmode
set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType make setlocal noexpandtab

let mapleader="\<Space>"
tnoremap <Esc> <C-\><C-n>
" adapted from https://github.com/tpope/vim-rsi/blob/master/plugin/rsi.vim
tnoremap        <C-A> <C-O>^
tnoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"

set wildmenu
set wildmode=list:longest
" Latex ignores
set wildignore+=*.aux,*.log,*.bbl,*.pdf,*.out,*.blg,
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

nnoremap <c-p> :FzfPreviewFromResourcesRpc project_mru git<CR>
nnoremap <leader>b :FzfPreviewBuffersRpc<CR>
" nnoremap <c-p> :Files<CR>
" nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Dispatch<CR>
nnoremap <leader>C :Dispatch make clean<CR>
nnoremap <leader>a :AbortDispatch<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

fun! StripTrailingWhitespaces()
    if &ft =~ 'markdown'
      return
    endif
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
" autocmd bufwritepre * :call StripTrailingWhitespaces()

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

autocmd BufNewFIle,BufReadPost *.tex setlocal spell spelllang=en_us

let g:mkdp_auto_close = 0

let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep

autocmd TermOpen * setlocal nonumber

let g:tex_flavor = 'latex'

set completeopt=menuone,noselect
