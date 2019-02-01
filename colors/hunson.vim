

"   See

"   http://vimcasts.org/episodes/creating-colorschemes-for-vim/
"   https://jonasjacek.github.io/colors/




hi clear
if exists ('syntax on')
	syntax reset
endif

let g:colors_name = 'hunson'
set background=dark




func! s:link (target, source)
	exec 'hi clear ' . a:target
	exec 'hi link ' . a:target . ' ' . a:source
endfunc


func! s:hi (group, fg, bg, style)
	exec 'hi clear ' . a:group

	if a:style != ''
		exec 'hi ' . a:group . ' cterm=' . a:style
		exec 'hi ' . a:group . ' gui='  . a:style
	endif

	exec 'hi ' . a:group . ' ctermbg=' . a:bg.xterm
	exec 'hi ' . a:group . ' ctermfg=' . a:fg.xterm

	exec 'hi ' . a:group . ' guibg='   . a:bg.hex
	exec 'hi ' . a:group . ' guifg='   . a:fg.hex
endfunc




let s:co_grey_0  = {'xterm': 16,  'hex': '#000000'}
let s:co_grey_3  = {'xterm': 232, 'hex': '#080808'}
let s:co_grey_7  = {'xterm': 233, 'hex': '#121212'}
let s:co_grey_11 = {'xterm': 234, 'hex': '#1c1c1c'}
let s:co_grey_19 = {'xterm': 236, 'hex': '#303030'}
let s:co_grey_27 = {'xterm': 238, 'hex': '#444444'}
let s:co_grey_35 = {'xterm': 240, 'hex': '#585858'}
let s:co_grey_42 = {'xterm': 242, 'hex': '#6c6c6c'}
let s:co_grey_50 = {'xterm': 244, 'hex': '#808080'}
let s:co_grey_58 = {'xterm': 246, 'hex': '#949494'}
let s:co_grey_66 = {'xterm': 248, 'hex': '#a8a8a8'}
let s:co_grey_74 = {'xterm': 250, 'hex': '#bcbcbc'}
let s:co_grey_85 = {'xterm': 253, 'hex': '#dadada'}
let s:co_grey_93 = {'xterm': 255, 'hex': '#eeeeee'}

"   Color name from HEX:   0  1  2  3  4  5
"                         00 5f 87 af d7 ff

let s:co_red_100 = {'xterm': 52,  'hex': '#5f0000'}
let s:co_red_500 = {'xterm': 196, 'hex': '#ff0000'}
let s:co_blu_134 = {'xterm': 74,  'hex': '#5fafd7'}
let s:co_tan_542 = {'xterm': 180, 'hex': '#ffd787'}
let s:co_orn_510 = {'xterm': 202, 'hex': '#ff5f00'}


"   Colors that only apply to GUI
"   Term uses the closest brighter alternative

let s:co_red_shade = {'xterm': 52,  'hex': '#140000'}
let s:co_grey_5    = {'xterm': 233, 'hex': '#0e0e0e'}

"   Color alias

let s:co_fg = s:co_grey_66
let s:co_bg = s:co_grey_0

let s:co_fg_nc = s:co_grey_58
let s:co_bg_nc = s:co_grey_3

let s:co_none = {'xterm': 'NONE', 'hex': 'NONE'}




"   Optional - fade non-current views

if get (g:, 'hunson_fade_nc_views', 1)
	call s:hi ('NormalNC', s:co_fg_nc, s:co_bg_nc, '')
endif


"   Optional - fill constant background

if get (g:, 'hunson_fill_const', 1)
	let s:co_bg_const = s:co_grey_5
else
	let s:co_bg_const = s:co_none
endif




"   Syntax - Common

call s:link ('Define',    'Special')
call s:link ('Exception', 'Special')
call s:link ('Macro',     'Special')
call s:link ('PreCondit', 'Special')

call s:hi ('Normal',            s:co_fg,       s:co_bg,         '')
call s:hi ('Comment',           s:co_grey_35,  s:co_grey_3,     'italic')
call s:hi ('Constant',          s:co_grey_58,  s:co_bg_const,   '')
call s:hi ('Error',             s:co_red_500,  s:co_red_shade,  '')
call s:hi ('Identifier',        s:co_grey_74,  s:co_none,       'italic')
call s:hi ('PreProc',           s:co_grey_42,  s:co_none,       'italic')
call s:hi ('Special',           s:co_blu_134,  s:co_none,       '')
call s:hi ('Type',              s:co_grey_42,  s:co_none,       'italic')
call s:hi ('Todo',              s:co_none,     s:co_none,       '')
call s:hi ('Statement',         s:co_grey_42,  s:co_none,       'italic')
call s:hi ('Underlined',        s:co_blu_134,  s:co_none,       'underline')
call s:hi ('WarningMsg',        s:co_orn_510,  s:co_none,       '')




"   UI - Alias

call s:hi ('HunsonFocus_0',     s:co_grey_42,  s:co_none,       '')
call s:hi ('HunsonFocus_1',     s:co_grey_42,  s:co_grey_3,     '')
call s:hi ('HunsonFocus_2',     s:co_grey_74,  s:co_none,       '')
call s:hi ('HunsonFocus_3',     s:co_grey_93,  s:co_grey_11,    '')

"   UI - Cursor and line number

call s:link ('CursorColumn',    'CursorLine')
call s:link ('LineNr',          'HunsonFocus_1')

call s:hi ('CursorLine',        s:co_none,     s:co_grey_7,     '')
call s:hi ('CursorLineNr',      s:co_grey_93,  s:co_none,       '')

"   UI - Diff

call s:link ('DiffAdd',         'DiffChange')

call s:hi ('DiffChange',        s:co_none,     s:co_grey_5,     '')
call s:hi ('DiffDelete',        s:co_red_100,  s:co_red_shade,  '')
call s:hi ('DiffText',          s:co_grey_85,  s:co_none,       '')

"   UI - Menus and tabs

call s:link ('WildMenu',        'HunsonFocus_3')

call s:link ('Pmenu',           'HunsonFocus_1')
call s:link ('PmenuSbar',       'HunsonFocus_1')
call s:link ('PmenuSel',        'HunsonFocus_3')
call s:link ('PmenuThumb',      'HunsonFocus_3')

call s:link ('TabLine',         'HunsonFocus_1')
call s:link ('TabLineFill',     'HunsonFocus_0')
call s:link ('TabLineSel',      'HunsonFocus_3')

"   UI - Search

call s:hi ('IncSearch',         s:co_tan_542,  s:co_bg,         'bold')
call s:hi ('Search',            s:co_tan_542,  s:co_bg,         'bold')

"   UI - Status line

call s:link ('StatusLine',      'HunsonFocus_2')
call s:link ('StatusLineNC',    'HunsonFocus_0')

"   UI - all the rest

hi clear Title

call s:link ('FoldColumn',      'HunsonFocus_1')
call s:link ('Folded',          'HunsonFocus_1')
call s:link ('SignColumn',      'HunsonFocus_1')

call s:hi ('ColorColumn',       s:co_red_500,  s:co_red_shade,  'italic')
call s:hi ('ErrorMsg',          s:co_red_500,  s:co_none,       '')
call s:hi ('MatchParen',        s:co_grey_93,  s:co_none,       '')
call s:hi ('NonText',           s:co_grey_42,  s:co_none,       '')
call s:hi ('VertSplit',         s:co_grey_5,   s:co_grey_5,     '')
call s:hi ('Visual',            s:co_grey_93,  s:co_grey_7,     '')
call s:hi ('Whitespace',        s:co_grey_19,  s:co_bg,         '')




"   Some other groups

" Conceal
" Cursor
" Directory
" EndOfBuffer (def. NonText)
" TermCursor
" TermCursorNC
" ModeMsg
" MsgSeparator
" MoreMsg
" SpellBad
" SpellCap
" SpellLocal
" SpellRare
" Question
" QuickFixLine
" SpecialKey
" StatusLineTerm
" StatusLineTermNC
" VisualNOS

