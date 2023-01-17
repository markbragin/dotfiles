set nocompatible

" PLUGINS---------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vimspector
Plug 'puremourning/vimspector'

" tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Plug 'preservim/nerdtree'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'

" statusline
Plug 'nvim-lualine/lualine.nvim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" python
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'nvie/vim-flake8', {'for': 'python'}

" themes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'navarasu/onedark.nvim'

call plug#end()

colorscheme gruvbox


" SETTINGS--------------------------------------------------------------------
set encoding=utf-8
set nobackup
set noswapfile
set hidden " hides buffers instead of closing them
set tabstop=4 " tab = 4 spaces
set autoindent
set copyindent " copy the prev indentation on autoindenting
set shiftwidth=4 " a number of spaces to use for autoindenting
set smartindent
set splitright
set splitbelow
set number
set relativenumber
set scrolloff=7
set showmatch " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase
set smarttab " insert tabs on the start of a line according to shiftwidth,
			 " not tabstop
set nohlsearch " highlight search terms
set incsearch " show matches as you type
set history=1000 " remember 1000 commands ans search history
set undolevels=1000 " 1000 undos
set colorcolumn=79
set title " change the terminal's title

" coc-settings
set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

filetype plugin indent on
autocmd filetype python set expandtab

" vim-commentary
autocmd FileType cpp setlocal commentstring=//\%s
autocmd FileType json setlocal commentstring=//\%s
" json comments
autocmd FileType json syntax match Comment +\/\/.\+$+




" MAPPING---------------------------------------------------------------------
" Quickly edit/reload the vimrc file
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>
nmap <leader>pv :Ex<CR>
" toggle hlsearch
nmap <silent><F1> :set invhlsearch<CR>

" run current script with python3 by CTRL+R in command and insert mode
autocmd FileType python map <buffer> <leader>p :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" flake
autocmd FileType python map <buffer> <Leader>x :call flake8#Flake8()<CR>


" preview markdown file
autocmd FileType markdown map <buffer> <leader>md :CocCommand markdown-preview-enhanced.openPreview<CR>

" exit terminal mode
tnoremap <esc> <C-\><C-n>

" system clipboard
nmap <C-p> "+p
vmap <C-y> "+y

" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w>v <C-w>v<C-w>l

" fastshit
inoremap jj <esc>
nnoremap <C-i> <C-u>zz
nnoremap <C-u> <C-d>zz
xmap <space>p "_dP
" edit the word under the cursor for the whole file
nmap <leader>rn :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" make file executable
nmap <silent><leader>sx <cmd>!chmod +x %<CR>
" nmap <leader>pv :Ex<CR>

" lang
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-l> <C-^>

" buffers
map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>

" nerdtree toggle
" map <F2> :NERDTreeMirror<CR>
" map <F2> :NERDTreeToggle<CR>


" COC MAPPINGS----------------------------------------------------------------
" Tab to move through list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Formatting code
nmap <leader>f :call CocAction('format')<CR>

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
" Restart
nnoremap <silent><nowait> <Leader>cr :CocRestart<CR>


" VIMSPECTOR MAPPINGS---------------------------------------------------------
" let g:vimspector_enable_mappings = 'HUMAN'
nnoremap         <F5>  :call BuildAndDebug()<CR>
nnoremap         <F3>  :call StopAndClose()<CR>
nnoremap         <F4>  <Plug>VimspectorRestart
nnoremap         <F6>  <Plug>VimspectorPause
nnoremap <leader><F6>  <Plug>VimspectorDisassemble
nnoremap         <F9>  <Plug>VimspectorToggleBreakpoint
nnoremap <leader><F9>  <Plug>VimspectorToggleConditionalBreakpoint
nnoremap         <F8>  <Plug>VimspectorAddFunctionBreakpoint
nnoremap <leader><F8>  <Plug>VimspectorRunToCursor
nnoremap         <F10> <Plug>VimspectorStepOver
nnoremap         <F11> <Plug>VimspectorStepInto
nnoremap         <F12> <Plug>VimspectorStepOver
" for normal mode - the word under the cursor
nnoremap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xnoremap <Leader>di <Plug>VimspectorBalloonEval




" buffers---------------------------------------------------------------------
" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
    finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
    let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
    echohl ErrorMsg
    echomsg a:msg
    echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
    if empty(a:buffer)
        let btarget = bufnr('%')
    elseif a:buffer =~ '^\d\+$'
        let btarget = bufnr(str2nr(a:buffer))
    else
        let btarget = bufnr(a:buffer)
    endif
    if btarget < 0
        call s:Warn('No matching buffer for '.a:buffer)
        return
    endif
    if empty(a:bang) && getbufvar(btarget, '&modified')
        call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
        return
    endif
    " Numbers of windows that view target buffer which we will delete.
    let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
    if !g:bclose_multiple && len(wnums) > 1
        call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
        return
    endif
    let wcurrent = winnr()
    for w in wnums
        execute w.'wincmd w'
        let prevbuf = bufnr('#')
        if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
            buffer #
        else
            bprevious
        endif
        if btarget == bufnr('%')
            " Numbers of listed buffers which are not the target to be deleted.
            let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
            " Listed, not target, and not displayed.
            let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
            " Take the first buffer, if any (could be more intelligent).
            let bjump = (bhidden + blisted + [-1])[0]
            if bjump > 0
                execute 'buffer '.bjump
            else
                execute 'enew'.a:bang
            endif
        endif
    endfor
    execute 'bdelete'.a:bang.' '.btarget
    execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>



" SOME CONFIGS----------------------------------------------------------------
" Telescope
" Find files using Telescope command-line sugar
" lua require('config/telescope')

" " statusline
" lua require('config/lualine')



" VIMSPECTOR SETTINGS---------------------------------------------------------

" build + debug
function BuildAndDebug()
    !make -C build
    call vimspector#AddFunctionBreakpoint( 'main' )
    call vimspector#Launch()
endfunction

function StopAndClose()
    let wins = g:vimspector_session_windows
    call win_gotoid(wins.watch)
    q
    call win_gotoid(wins.variables)
    q
    call win_gotoid(wins.stack_trace)
    q
    call win_gotoid(wins.terminal)
    q
endfunction
    
function! s:CustomiseUI()
    let wins = g:vimspector_session_windows
    call win_gotoid(wins.output)
    q
    call win_gotoid(wins.variables)
    45wincmd |
endfunction

function s:SetUpTerminal()
    let terminal_win = g:vimspector_session_windows.terminal
    call win_gotoid( terminal_win )
    10wincmd _
endfunction

augroup MyVimspectorUICustomistaion
    autocmd!
    autocmd User VimspectorUICreated call s:CustomiseUI()
    autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
augroup END
