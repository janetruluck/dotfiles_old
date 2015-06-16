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
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
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
    set foldmethod=syntax
    set foldlevel=100

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
            set statusline=%F        " Filename
            set statusline+=%m       " Flags
            set statusline+=%r
            set statusline+=%w      
            set statusline+=%=       " separate left/right side
            set statusline+=%y       " file type"
            set statusline+=\ %c,    " current col"
            set statusline+=%l/%L    " current line / total lines"
            set statusline+=\ %p%%   " % of file
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
    " hi IndentGuidesOdd  ctermbg=black
    " hi IndentGuidesEven ctermbg=darkgrey
    " Remove Trailing whitespace  {
        autocmd FileType c,cpp,java,go,php,javascript,python,ruby,twig,xml,yml autocmd BufWritePre <buffer> :%s/\s\+$//e " Auto removal on save for certain file types
        nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> " On Demand whitespace removal, push <F5> baby!
    " }
" }
" Key Remanps {
    " Remap Leader key
    let mapleader = ','
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
" }
" Plugin Settings {
  " Indent Guides {
        " let g:indent_guides_auto_colors = 1
        " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
        " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
        " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }
    " Tabularize {
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a=> :Tabularize /=><CR>
        vmap <Leader>a=> :Tabularize /=><CR>
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
        nmap <Leader>a} :Tabularize /}<CR>
        vmap <Leader>a} :Tabularize /}<CR>
    " }
" }
" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
" Custom Commands {
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " RUNNING TESTS
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <leader>t :call RunTestFile()<cr>
    map <leader>T :call RunNearestTest()<cr>
    map <leader>a :call RunTests('')<cr>
    map <leader>c :w\|:!cucumber<cr>
    map <leader>w :w\|:!cucumber --profile wip --tags @wip:99<cr>
    map <leader>W :w\|:!cucumber --profile wip %<cr>
    function! RunTestFile(...)
        if a:0
            let command_suffix = a:1
        else
            let command_suffix = ""
        endif
        " Run the tests for the previously-marked file.
        let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
        if in_test_file
            call SetTestFile()
        elseif !exists("t:grb_test_file")
            return
        end
        call RunTests(t:grb_test_file . command_suffix)
    endfunction
    function! RunNearestTest()
        let spec_line_number = line('.')
        call RunTestFile(":" . spec_line_number . " -b")
    endfunction
    function! SetTestFile()
        " Set the spec file that tests will be run for.
        let t:grb_test_file=@%
    endfunction
    function! RunTests(filename)
        " Write the file and run tests for the given filename
        :w
        :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
        :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
        :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
        :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
        :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
        :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
        if match(a:filename, '\.feature$') != -1
            exec ":!cucumber " . a:filename
        elseif match(a:filename, '_test\.rb$') != -1
            " This assumes that you have the m gem installed for minitest
            " https://github.com/qrush/m
            if filereadable("test/test_helper.rb")
                exec ":!m " . a:filename
            else
                exec ":!ruby " . a:filename
            end
        else
            if filereadable("script/test")
                exec ":!script/test " . a:filename
            elseif filereadable("Gemfile")
                exec ":!bundle exec rspec --color " . a:filename
            else
                !echo here6
                exec ":!rspec --color " . a:filename
            end
        end
    endfunction
" }
