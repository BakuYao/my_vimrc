call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/YouCompleteMe'
" added nerdtree
Plug 'scrooloose/nerdtree'
" added ctags
Plug 'universal-ctags/ctags'
" added nerdcommenter
Plug 'preservim/nerdcommenter'

Plug 'rhysd/vim-clang-format'

" added git-blame
Plug 'zivyangll/git-blame.vim'

call plug#end()
" clang-format
" let g:clang_format#auto_format_on_insert_leave=1
" function! Formatonsave()
"   let l:formatdiff = 1
"   py3f /usr/share/vim/addons/syntax/clang-format-6.0.py
" endfunction
" autocmd BufWritePre *.h,*.hpp,*.c,*.cc,*.cpp call Formatonsave()

" move one line
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>

" https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim
let &t_TI = ""
let &t_TE = ""

" YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_use_clangd = 0
set completeopt-=preview


" nerdtree
map <F5> :NERDTreeToggle<CR>

" Copilot enable
let g:copilot_enable = 1

" ctags
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" jump into tag with `\t`. This is workaround on windows machine because
" ctrl+] doesn't work
nnoremap <leader>t :tag <c-r><c-w><cr>

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '//','leftAlt': '/*','rightAlt': '*/' },
    \ 'python': { 'left': '#','leftAlt': '"""','rightAlt': '"""' }
    \ }
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
map <leader>/ <plug>NERDCommenterToggle
" map <C-q> <plug>NERDCommenterToggle

" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" add any cscope database in current directory
if filereadable("cscope.out")
    cs add cscope.out
" else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

" show msg when any other cscope db added
" set cscopeverbose  

" Cscope auto exec
" function! Create_cscope_file(execfile)
"     exe "! bash" a:execfile a:execfile
" endfunction
"
" function! Create_cscope_out(cscope_files)
"     exe "! cscope -bRq -i" a:cscope_files
" endfunction
"
" if has("cscope")
"     let cscope_exec=findfile("cscope.sh", ".;")
"     if !empty(cscope_exec)
"         if cscope_exec ==? "cscope.sh"
"             set csre
"         endif
"         silent call Create_cscope_file(cscope_exec)
"         let cscope_files=findfile("cscope.files", ".;")
"         if !empty(cscope_files) && filereadable(cscope_files)
"             silent call Create_cscope_out(cscope_files)
"             let cscope_out=findfile("cscope.out", ".;")
"             if !empty(cscope_out) && filereadable(cscope_out)
"                 silent exe "cs add" cscope_out
"             endif
"         endif
"     endif
" endif

" cscope shortcut
noremap <leader>cs :cs find s 
noremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
noremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

" check git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Cut git commit line to 72 characters
au FileType gitcommit setlocal tw=72

set nu
set ai
set cursorline
set smarttab       " Smart handling of the tab key
set shiftround     " Round indent to multiple of shiftwidth
set shiftwidth=4   " Number of spaces for each indent
set tabstop=4      " Number of spaces for tab key
set softtabstop=4  " Number of spaces for tab key while performing editing operations
set expandtab
set mouse=a
set backspace=2
set history=100
set t_Co=256
set incsearch
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1
set termencoding=utf-8
set tags=./tags,tags;$HOME

" Accessing the system clipboard
set clipboard=unnamedplus

" toggle highlight search
noremap <F4> :set hlsearch! hlsearch?<CR>

inoremap ( ()<ESC>i
" Move Cursor Right When Typing ')' and Character Under Cursor is ')'
" https://stackoverflow.com/a/62615956/11425048
inoremap <silent><expr> ) getline('.')[col('.')-1] == ')' ? '<c-g>U<right>' : ')'
inoremap [ []<ESC>i
inoremap <silent><expr> ] getline('.')[col('.')-1] == ']' ? '<c-g>U<right>' : ']'
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap {<CR> {<CR>}<ESC>ko
inoremap {{ {}<ESC>i
filetype indent on

" open JSON reader jq in vim
command JSON %!jq .

" open terminal below all splits
cabbrev bterm bo term

" scroll terminal. press a or i to exit
tnoremap <c-b> <c-\><c-n>

command! CopyPath let @+ = expand('%')

"""""""""""""""""""""""""""coc.nvim""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
" set hidden
"
" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
"
" Give more space for displaying messages.
" set cmdheight=2
"
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300
"
" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
"
" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
"
" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
"
" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
"
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
"
" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
"
" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"
" let g:coc_disable_startup_warning = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
