"I borrowed this crazy code from vim-tomorrow-theme colorschemes

" Returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" Returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfun

" Returns the palette index for the given grey index
fun! s:grey_colour(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfun

" Returns an approximate colour index for the given colour level
fun! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" Returns the actual colour level for the given colour index
fun! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfun

" Returns the palette index for the given R/G/B colour indices
fun! s:rgb_colour(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" Returns the palette index to approximate the given R/G/B colour levels
fun! s:colour(r, g, b)
  " Get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " Get the closest colour
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " There are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " Use the grey
      return s:grey_colour(l:gx)
    else
      " Use the colour
      return s:rgb_colour(l:x, l:y, l:z)
    endif
  else
    " Only one possibility
    return s:rgb_colour(l:x, l:y, l:z)
  endif
endfun

" Returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

  return s:colour(l:r, l:g, l:b)
endfun

" Sets the highlighting for the given group
fun! s:X(group, fg, bg, attr)
  if a:fg != ""
    exec "silent hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . s:rgb(a:fg)
  endif
  if a:bg != ""
    exec "silent hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . s:rgb(a:bg)
  endif
  if a:attr != ""
    exec "silent hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun


"the original values would be 24 bit color but apparently that is not possible
let s:colors = {
  \ 'brown'       : "905532",
  \ 'aqua'        : "3AFFDB",
  \ 'blue'        : "689FB6",
  \ 'darkBlue'    : "44788E",
  \ 'purple'      : "834F79",
  \ 'lightPurple' : "834F79",
  \ 'red'         : "AE403F",
  \ 'beige'       : "F5C06F",
  \ 'yellow'      : "F09F17",
  \ 'orange'      : "D4843E",
  \ 'darkOrange'  : "F16529",
  \ 'pink'        : "CB6F6F",
  \ 'salmon'      : "EE6E73",
  \ 'green'       : "8FAA54",
  \ 'lightGreen'  : "31B53E",
  \ 'white'       : "FFFFFF"
\ }

let s:match_colors = {
  \ '(favicon)@<!\.(jpg|jpeg|bmp|png|gif|ico)$' : 'aqua',
  \ '\.go$'                       : 'beige',
  \ '\.l?hs$'                     : 'beige',
  \ '\.json$'                     : 'beige',
  \ '(angular|jquery|backbone|require|materialize|mootools|gruntfile|gulpfile)@<!\.js$' : 'beige',
  \ '\.dart$'                     : 'blue',
  \ '\.fsscript$'                 : 'blue',
  \ '\.fs[x|i]?$'                 : 'blue',
  \ '\.css$'                      : 'blue',
  \ '\.dump$'                     : 'blue',
  \ '\.(pl|pm|t|db)$'             : 'blue',
  \ '\.(jsx|tsx?)$'               : 'blue',
  \ '\.(cpp|c\+\+|cxx|cc|cp|c)$'  : 'blue',
  \ 'dropbox'                     : 'blue',
  \ '\.coffee$'                   : 'brown',
  \ '\.f#$'                       : 'darkBlue',
  \ '\.sql$'                      : 'darkBlue',
  \ '.*\.less$'                   : 'darkBlue',
  \ '\.rss$'                      : 'darkOrange',
  \ '\.(rs|rlib)$'                : 'darkOrange',
  \ '\.ai$'                       : 'darkOrange',
  \ '\.xul$'                      : 'darkOrange',
  \ '.*\.html?$'                  : 'darkOrange',
  \ '\.clj[c|s]?$'                : 'green',
  \ '\.(edn|vue)$'                : 'green',
  \ '\.fish$'                     : 'green',
  \ '\.twig$'                     : 'green',
  \ '\.styl$'                     : 'green',
  \ 'node_modules$'               : 'green',
  \ '\.mustache$'                 : 'orange',
  \ '\.hbs$'                      : 'orange',
  \ '\.slim$'                     : 'orange',
  \ '\.hrl$'                      : 'pink',
  \ '\.vim(rc)?$'                 : 'green',
  \ '\.ps[d|b]$'                  : 'darkBlue',
  \ '(materialize)@<!\.s[a|c]ss$' : 'pink',
  \ 'gulpfile\.(coffee|js|ls)'    : 'pink',
  \ '\.jl$'                       : 'purple',
  \ '\.(sln|suo)$'                : 'purple',
  \ '\.lua$'                      : 'purple',
  \ '\.java$'                     : 'purple',
  \ '.*\.php$'                    : 'purple',
  \ 'procfile$'                   : 'purple',
  \ '\.erl$'                      : 'lightPurple',
  \ '\.sh\*?'                     : 'lightPurple',
  \ '\.scala$'                    : 'red',
  \ '\.d$'                        : 'red',
  \ '.*\.e?rb$'                   : 'red',
  \ '\.mli?$'                     : 'yellow',
  \ '\.ejs$'                      : 'yellow',
  \ '\.py[c|o|d]?$'               : 'yellow',
  \ '\.(md|markdown)$'            : 'yellow',
  \ 'favicon\.ico$'               : 'yellow',
  \ 'gruntfile\.(coffee|js|ls)$'  : 'yellow',
  \ '\.(conf|ini|yml|bat|diff)$'  : 'white',
  \ '\.ds_store$'                 : 'white',
  \ '\.(gitconfig|gitignore)$'    : 'white',
  \ '\.(bashrc|bashprofile|)$'    : 'white',
  \ 'license$'                    : 'white',
  \ '.*mootools.*\.js$'           : 'white',
  \ '.*jquery.*\.js$'             : 'blue',
  \ '.*angular.*\.js$'            : 'red',
  \ '.*backbone.*\.js$'           : 'darkBlue',
  \ '.*require.*\.js$'            : 'blue',
  \ '.*materialize.*\.(js|css)$'  : 'salmon'
\ }


if !exists('g:NERDTreePatternMatchHighlightColor')
  let g:NERDTreePatternMatchHighlightColor = {}
endif

" Declare syntax in each extention patterns
for [key, val] in items(s:colors)
  if !has_key(g:NERDTreePatternMatchHighlightColor, key)
    let g:NERDTreePatternMatchHighlightColor[key] = val
    call s:X('nerdtreePatternMatchIcon_'.key, val, '', '')
  endif
endfor


for [key, val] in items(s:match_colors)
  " \c : ignore cases
  " \zs: match start from
  " \ze: matche ends
  exec 'syn match nerdtreePatternMatchIcon_'.val.' "\v\c\zs[^\[]+\ze\].*'.key.'" containedin=NERDTreeFlags'
  exec 'syn match nerdtreePatternMatchIcon_'.val.' "\v\c\zs[^\[]+\ze\].*'.key.'" containedin=NERDTreeExecFile'
endfor

