" Vim color file
" Converted from Textmate theme Atom Dark using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Atom Dark"

hi Cursor ctermfg=234 ctermbg=231 cterm=NONE guifg=#1d1f20 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#333535 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#333535 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#333535 gui=NONE
hi LineNr ctermfg=245 ctermbg=236 cterm=NONE guifg=#8b8b89 guibg=#333535 gui=NONE
hi VertSplit ctermfg=240 ctermbg=240 cterm=NONE guifg=#5d5e5d guibg=#5d5e5d gui=NONE
hi MatchParen ctermfg=117 ctermbg=NONE cterm=underline guifg=#8ecbfe guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=240 cterm=bold guifg=#f8f8f2 guibg=#5d5e5d gui=bold
hi StatusLineNC ctermfg=231 ctermbg=240 cterm=NONE guifg=#f8f8f2 guibg=#5d5e5d gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi IncSearch ctermfg=234 ctermbg=155 cterm=NONE guifg=#1d1f20 guibg=#9fff60 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=114 ctermbg=NONE cterm=NONE guifg=#90cc99 guibg=NONE gui=NONE
hi Folded ctermfg=66 ctermbg=234 cterm=NONE guifg=#737c7c guibg=#1d1f20 gui=NONE

hi Normal ctermfg=231 ctermbg=235 cterm=NONE guifg=#f8f8f2 guibg=#1d1f20 gui=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=114 ctermbg=NONE cterm=NONE guifg=#90cc99 guibg=NONE gui=NONE
hi Comment ctermfg=66 ctermbg=NONE cterm=NONE guifg=#737c7c guibg=NONE gui=NONE
hi Conditional ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#44810b gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#890606 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#1e3554 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=207 ctermbg=NONE cterm=NONE guifg=#ff73fd guibg=NONE gui=NONE
hi Function ctermfg=223 ctermbg=NONE cterm=NONE guifg=#ffd2a7 guibg=NONE gui=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi Keyword ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi Label ctermfg=155 ctermbg=NONE cterm=NONE guifg=#9fff60 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=235 cterm=NONE guifg=#49483e guibg=#282a2b gui=NONE
hi Number ctermfg=207 ctermbg=NONE cterm=NONE guifg=#ff73fd guibg=NONE gui=NONE
hi Operator ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi PreProc ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=236 cterm=NONE guifg=#49483e guibg=#333535 gui=NONE
hi Statement ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi String ctermfg=155 ctermbg=NONE cterm=NONE guifg=#9fff60 guibg=NONE gui=NONE
hi Tag ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=66 ctermbg=NONE cterm=inverse,bold guifg=#737c7c guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi rubyFunction ctermfg=223 ctermbg=NONE cterm=NONE guifg=#ffd2a7 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=114 ctermbg=NONE cterm=NONE guifg=#90cc99 guibg=NONE gui=NONE
hi rubyConstant ctermfg=229 ctermbg=NONE cterm=NONE guifg=#f7ffb6 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=155 ctermbg=NONE cterm=NONE guifg=#9fff60 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=153 ctermbg=NONE cterm=NONE guifg=#c0c5fe guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=189 ctermbg=NONE cterm=NONE guifg=#c8c5ff guibg=NONE gui=NONE
hi rubyInclude ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=189 ctermbg=NONE cterm=NONE guifg=#c8c5ff guibg=NONE gui=NONE
hi rubyRegexp ctermfg=155 ctermbg=NONE cterm=NONE guifg=#9fff60 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=155 ctermbg=NONE cterm=NONE guifg=#9fff60 guibg=NONE gui=NONE
hi rubyEscape ctermfg=114 ctermbg=NONE cterm=NONE guifg=#90cc99 guibg=NONE gui=NONE
hi rubyControl ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=189 ctermbg=NONE cterm=NONE guifg=#c8c5ff guibg=NONE gui=NONE
hi rubyOperator ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi rubyException ctermfg=117 ctermbg=NONE cterm=NONE guifg=#8ecbfe guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=189 ctermbg=NONE cterm=NONE guifg=#c8c5ff guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=229 ctermbg=NONE cterm=NONE guifg=#f7ffb6 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=66 ctermbg=NONE cterm=NONE guifg=#737c7c guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=114 ctermbg=NONE cterm=NONE guifg=#90cc99 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=189 ctermbg=NONE cterm=NONE guifg=#c8c5ff guibg=NONE gui=NONE
hi yamlAlias ctermfg=189 ctermbg=NONE cterm=NONE guifg=#c8c5ff guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=155 ctermbg=NONE cterm=NONE guifg=#9fff60 guibg=NONE gui=NONE
hi cssURL ctermfg=153 ctermbg=NONE cterm=NONE guifg=#c0c5fe guibg=NONE gui=italic
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssColor ctermfg=114 ctermbg=NONE cterm=NONE guifg=#90cc99 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssValueLength ctermfg=207 ctermbg=NONE cterm=NONE guifg=#ff73fd guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
