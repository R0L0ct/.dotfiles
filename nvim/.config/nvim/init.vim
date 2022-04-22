"=================================================================================
"general
"=================================================================================
function! CustomFold()
	return printf('    %-6d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

let mapleader = " " " Set leader key to space to call which-key

syntax on
set ma
set cursorline
set autoread
set nobackup
set nowritebackup
set noswapfile
set foldlevelstart=99
"use y and p with the system clipboard
set clipboard=unnamedplus
set autoindent " Start new lines correctly indented
set completeopt=menuone,noselect " Completion engine options
set fixeol " Restore EOL at EOF if missing when writing
set foldmethod=marker " Only allow foldings with triple brackets
set guicursor=a:block " Force cursor to be a block at all times
set hidden " Hide inactive buffers instead of deleting them
set hlsearch " Highlight all search matches
set inccommand=split " Incrementally show effects of commands, opens split
set incsearch " Highlight search matches while writing (with hlsearch)
set linebreak " Respect WORDS when wrap-breaking lines (see wrap)
set mouse=nvi " Allow mouse everywhere except in command line mode
set noexpandtab " Do not expand tabs to spaces (see softtabstop)
set number " Number column to the left (used with relativenumber)
set nrformats=unsigned " Treat all numbers as unsigned with <C-A> and <C-X>
set relativenumber " Show numbers relative to cursor position (see number)
set scrolloff=5 " Leave 5 lines above and below cursor
set shiftwidth=0 " Force indent spaces to equal to tabstop (see tabstop)
set shortmess+=c " Avoid blocking 'Pattern not found' messages
set showcmd " Show the keys pressed in normal mode until action is run
set signcolumn=number " Overlap the number bar with error signs
set smartindent " Ident new lines in a smart way (see autoindent)
set smarttab " Treat spaces as tabs in increments of shiftwidth
set softtabstop=0 " Do not insert spaces when pressing tab (see shiftwidth)
set splitbelow " Open splits below the current window
set splitright " Open splits right of the current window
set tabstop=4 " Number of columns to move when pressing <TAB> (see noexpandtab)
set termguicolors " Enable 24-bit RGB color in the TUI
set timeoutlen=500 " Milliseconds to wait before completing a mapped sequence
set updatetime=300 " Milliseconds to wait before writing to swap file
set wrap " Continue on the next line if insufficient columns (see linebreak)

set fillchars=fold:\ | set foldtext=CustomFold() " Minimalistic folding
set listchars=tab:\│\ ,trail:· list "Alternate tab: »>

filetype plugin indent on " Required by plugins
syntax on " Highlight symbols

"==================================================================================
"plugins
"==================================================================================

call plug#begin('~/.config/nvim/autoload/')


Plug 'neoclide/coc.nvim', {'branch': 'release'}

"lorem
Plug 'derektata/lorem.nvim'
Plug 'vim-scripts/loremipsum'


"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Markdown preview
Plug 'ellisonleao/glow.nvim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

"Language packs
Plug 'sheerun/vim-polyglot'

"Nvim motions
Plug 'phaazon/hop.nvim'

"LSP autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"File browsing
Plug 'nvim-telescope/telescope-file-browser.nvim'

"Native LSP
Plug 'neovim/nvim-lspconfig'

"Buffer navigation
Plug 'nvim-lualine/lualine.nvim'

"Go
"Plug 'fatih/vim-go'

"Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'

"debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

"Grammar checking because I can't english
Plug 'rhysd/vim-grammarous'

"Telescope Requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"git diff
Plug 'sindrets/diffview.nvim'

"magit
Plug 'TimUntersberger/neogit'

"todo comments
Plug 'folke/todo-comments.nvim'

"devicons
Plug 'kyazdani42/nvim-web-devicons'

"fullstack dev
Plug 'pangloss/vim-javascript' "JS support
Plug 'leafgarland/typescript-vim' "TS support
Plug 'maxmellon/vim-jsx-pretty' "JS and JSX syntax
Plug 'jparise/vim-graphql' "GraphQL syntax
Plug 'mattn/emmet-vim'

"barbar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

"gruvox theme
Plug 'morhetz/gruvbox'

"tokyonight theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

"Harpoon
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'

"closetag
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

"hexa
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()



"==============================================================================
"key combos
"==============================================================================

set encoding=UTF-8
let mapleader = " "

" Double ESC to exit from terminal insert mode to terminal normal mode
tnoremap <Esc><Esc> <C-\><C-n>

"Navigate buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>

" Navigate through buffers centering the line you were in, requires barbar.nvim
nnoremap <C-n> <cmd>BufferNext<cr>`"zz
nnoremap <C-p> <cmd>BufferPrevious<cr>`"zz

nnoremap ccd :CocList diagnostics<CR>
"Other
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ne :Telescope file_browser<CR>
nnoremap <leader>f :call CocAction('format')<CR>

autocmd StdinReadPre * let s:std

"harpoon mapeo
nnoremap <leader>sa :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>ss :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>su :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>si :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>so :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>sp :lua require("harpoon.ui").nav_file(4)<CR>
"==============================================================================
" plugin configs
"==============================================================================
"Go - format on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

"fzf
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:glow_use_pager = v:false

" Focus and redistribute split windows
noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Buffer navigation
" TODO
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"==================================================================================
"automations
"==================================================================================

augroup AuBufWritePre
	autocmd!
	autocmd BufWritePre * let current_pos = getpos(".")
	autocmd BufWritePre * silent! undojoin | %s/\s\+$//e
	autocmd BufWritePre * silent! undojoin | %s/\n\+\%$//e
	autocmd BufWritePre * call setpos(".", current_pos)
	autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
augroup END

augroup AuYank
	autocmd!
	autocmd TextYankPost *
		\ lua vim.highlight.on_yank{higroup="IncSearch", timeout=400, on_visual=true}
augroup END

"==================================================================================
"commands
"==================================================================================

command! Q q " Quit while still pressing Shift
command! Qa qa " Quit all while still pressing Shift
command! W w " Write while still pressing Shift
command! Wq wq " Write-quit while still pressing Shift
command! Wqa wqa " Write-quit all while still pressing Shift

"****************************************************
"Markdown Preview Recommended Settings
"****************************************************
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 1

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

"normal/insert
nnoremap <> :MarkdownPreview

"Telescope
" will find .lua file that exist at runtime
" should be unique
lua require("rolo")
nnoremap <C-_> <cmd>lua require("rolo").curr_buf() <cr>
" nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top <cr>
" nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", prompt_position="top"})<cr>
nnoremap <F4> :lua package.loaded.rolo= nil <cr>:source ~/.config/nvim/init.vim <cr>
"nnoremap <leader>sf :Telescope find_files cwd=~/Documents/Hobbies<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"---COC-Settings---
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-prettier', 'coc-angular', 'coc-vimtex']

"---VIM_CLOSETAG---
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,xml,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"Hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']


"SOURCES
"luafile $HOME/.config/nvim/lua/plug-colorizer.lua




"---THEMES---
"let g:tokyonight_style = "night"
"colorscheme tokyonight

"let g:gruvbox_contrast_dark = "hard"
