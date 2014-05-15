" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
" Basics {
    set nocompatible        " Must be first line
    if !(has('win16') || has('win32') || has('win64'))
        set shell=/bin/sh
    endif
    set ttyfast
" }
" Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
    filetype on
    filetype off
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
" }
" Use bundles config {
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
" }
" General Settings {
  set t_Co=256                        " Set vim to 256 color
  scriptencoding utf-8
  filetype plugin indent on           " Automatically detect file types.
  syntax on                           " Syntax highlighting
  set mouse=a                         " Automatically enable mouse usage
  set mousehide                       " Hide the mouse cursor while typing
  set history=1000                    " Store a ton of history (default is 20)
  set hidden                          " Allow buffer switching without saving"
  set nospell
  set virtualedit=onemore             " Allow for cursor beyond last character
  set splitright                      " Split new files to the right with C-w + n
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif " Always switch to the current file directory"
  " Backup and undo options {
    set backup                  " Enable Backups
    let common_directory = $HOME . "/.vimbackups/"
    if exists("*mkdir")
      if !isdirectory(common_directory)
        echo "Creating common backup directory at (this is a one time thing unless deleted or moved): " . common_directory
        call mkdir(common_directory)
      endif
    endif
    if isdirectory(common_directory)
      exec "set backupdir=" . common_directory
      exec "set undodir=" . common_directory
      exec "set directory=" . common_directory
    else
      echo "Warning: Unable to find backup directory: " . common_directory
      echo "Try: mkdir -p " . common_directory
    endif
    if has('persistent_undo')
      set undofile                " Enable persistent undo
      set undolevels=1000         " Maximum number of changes that can be undone
      set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif
  " }
  " Use system clipboard {
    if has("unix")
      let s:uname = system("uname")
      if s:uname == "Darwin\n"
        set clipboard+=unnamed
      else
        set clipboard+=unnamedplus
      endif
    else
      set clipboard+=unnamedplus
    endif
  " }
" }
" Color Scheme and GUI modifications {
    colorscheme atom-dark           " Set colorscheme
    set backspace=indent,eol,start  " Backspace for dummies"
    set background=dark             " Assume a dark background"
    " These appear to cause some significant lag when scrolling large files
    " I added a keymap to enable them on demand and disabled by defautl (check
    " keyremaps) uncomment them to enable them by default
    "set cursorcolumn                " Enable cursor column
    "set cursorline                  " Enable cursor line 
    set colorcolumn=80              " Add indicator for 80 character line length
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace


    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif
    " Configure Status Line {
        if has('statusline')
            set laststatus=2
            " Broken down into easily includeable segments
            set statusline=%<%f\                     " Filename
            set statusline+=%w%h%m%r                 " Options
            set statusline+=%{fugitive#statusline()} " Git Hotness
            set statusline+=\ [%{&ff}/%Y]            " Filetype
            set statusline+=\ [%{getcwd()}]          " Current dir
            set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
        endif
    " }
    " Highlight Whitespace {
        highlight ExtraWhitespace ctermbg=red guibg=red
        match ExtraWhitespace /\s\+$/
        autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
        autocmd BufWinLeave * call clearmatches()
    " }
" Formatting {
    set pastetoggle=<F12>                " Paste toggle to insert blocks of code
    set nowrap                          " Do not wrap long lines
    set autoindent                      " Indent at the same level of the previous line
    set shiftwidth=2                    " Use indents of 2 spaces
    set expandtab                       " Tabs are spaces, not tabs
    set tabstop=2                       " An indentation every four columns
    set softtabstop=2                   " Let backspace delete indent
    set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                      " Puts new vsplit windows to the right of the current
    set splitbelow                      " Puts new split windows to the bottom of the current
    " Alternate highlights for indents
    hi IndentGuidesOdd  ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
    " Remove Trailing whitespace  {
        autocmd FileType c,cpp,java,go,php,javascript,python,ruby,twig,xml,yml autocmd BufWritePre <buffer> :%s/\s\+$//e " Auto removal on save for certain file types
        nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> " On Demand whitespace removal, push <F5> baby!
    " }
" }
" Key Remanps {
    let mapleader = ',' " Remap Leader key
    " Remap : to ; key for vim commands
    nnoremap ; :
    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$
    " Add toggling for curor highlighting
    nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
    " Use ctrl-[hjkl] to select the active split! {
     nmap <silent> <c-k> :wincmd k<CR>
     nmap <silent> <c-j> :wincmd j<CR>
     nmap <silent> <c-h> :wincmd h<CR>
     nmap <silent> <c-l> :wincmd l<CR>
    " }
    " Fix home and end keybindings for screen, particularly on mac {
        map [F $
        imap [F $
        map [H g0
        imap [H g0
    " }
    " Shift Key fixes {
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    " }
" }
" Plugin Settings {
    " Powerline {
        let g:airline_theme = 'powerlineish'
        let g:airline_powerline_fonts = 1 " Auto use powerline symbols
        if !exists('g:airline_powerline_fonts')
          " Use the default set of separators with a few customizations
          let g:airline_left_sep='›'  " Slightly fancier than '>'
          let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
  " }
  " Indent Guides {
        let g:indent_guides_auto_colors = 1
        " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
        " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
        " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }
    " vim-gitgutter {
        " https://github.com/airblade/vim-gitgutter/issues/106
        let g:gitgutter_realtime = 0
        " stop eager execution
        let g:gitgutter_eager = 0
    " }
    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        nnoremap <silent> <leader>gg :GitGutterToggle<CR>
    " }
    " Tabularize {
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        nmap <Leader>a{ :Tabularize /{<CR>
        vmap <Leader>a{ :Tabularize /{<CR>
        nmap <Leader>a} :Tabularize /}CR>
        vmap <Leader>a} :Tabularize /}CR>
    " }
    " neocomplete {
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_auto_delimiter = 1
        let g:neocomplete#max_list = 15
        let g:neocomplete#force_overwrite_completefunc = 1

        " SuperTab like snippets behavior.
        imap <silent><expr><TAB> neosnippet#expandable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                    \ "\<C-e>" : "\<TAB>")
        smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
                    \ 'default' : '',
                    \ 'vimshell' : $HOME.'/.vimshell_hist',
                    \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings {
            " These two lines conflict with the default digraph mapping of <C-K>
            imap <C-k> <Plug>(neosnippet_expand_or_jump)
            smap <C-k> <Plug>(neosnippet_expand_or_jump)

            inoremap <expr><C-g> neocomplete#undo_completion()
            inoremap <expr><C-l> neocomplete#complete_common_string()
            inoremap <expr><CR> neocomplete#complete_common_string()

            " <TAB>: completion.
            inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
            inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

            " <CR>: close popup
            " <s-CR>: close popup and save indent.
            inoremap <expr><s-CR> pumvisible() ? neocomplete#close_popup()"\<CR>" : "\<CR>"
            inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

            " <C-h>, <BS>: close popup and delete backword char.
            inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
            inoremap <expr><C-y> neocomplete#close_popup()
        " }

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

        " This appears to be a cause of seg faults at the moment in Ruby files
        " Enable heavy omni completion.
        "if !exists('g:neocomplete#sources#omni#input_patterns')
            "let g:neocomplete#sources#omni#input_patterns = {}
        "endif
        "let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

        " Use honza's snippets.
        let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

        " Enable neosnippet snipmate compatibility mode
        let g:neosnippet#enable_snipmate_compatibility = 1

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        " Disable the neosnippet preview candidate window
        " When enabled, there can be too much visual noise
        " especially when splits are used.
        set completeopt-=preview
    " }
    " NERDTree {
        " auto open when vim starts
        "autocmd vimenter * NERDTree
        " auto close if last buffer
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
        " plugin Keymaps {
            nmap <C-n> :NERDTreeToggle<CR>
        " }
    " }
    " ctrl-p{
        let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                \ 'file': '\v\.(exe|so|dll)$',
                \ 'link': 'some_bad_symbolic_links',
                \ }
        let g:ctrlp_working_path_mode = "r"
    " }
" }
" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
