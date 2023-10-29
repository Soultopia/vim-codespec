"author : zhuyuheng
"e-mail : zhuyheng.zyh@alibaba-inc.com

if exists("g:loaded_codespec") || v:version < 704 || &cp
  finish
endif
let g:loaded_codespec = 1

let s:cpo_save = &cpo
set cpo&vim

let g:_ARG_CODESPEC_DEFAULTS = {
  \'author':      'Soultopia',
  \'email':       'Soultopia@mail.com',
  \'always_ff':    expand("<sfile>:p:h").'/sv-model/always_ff.v',
  \'always_comb':  expand("<sfile>:p:h").'/sv-model/always_comb.v',
  \'always_latch': expand("<sfile>:p:h").'/sv-model/always_latch.v',
  \'assign':       expand("<sfile>:p:h").'/sv-model/assign.v',
  \'case_inside':  expand("<sfile>:p:h").'/sv-model/case_inside.v',
  \'generate':     expand("<sfile>:p:h").'/sv-model/generate.v',
  \'module':       expand("<sfile>:p:h").'/sv-model/module.v',
  \'package':      expand("<sfile>:p:h").'/sv-model/package.v',
  \'struct':       expand("<sfile>:p:h").'/sv-model/struct.v'
  \}

for s:key in keys(g:_ARG_CODESPEC_DEFAULTS)
    if !exists('g:arg_codespec_' . s:key)
      let g:arg_codespec_{s:key} = copy(g:_ARG_CODESPEC_DEFAULTS[s:key])
    endif
    if s:key =~ 'alb.*_file'
      let g:arg_codespec_{s:key} = expand(g:arg_codespec_{s:key})
    endif
endfor

function! s:InsertHeader() abort
  let line = getline(2)
  if line =~ 'Alibaba.*T-Head'
    return
  endif
  call append( 0, "///////////////////////////////////////////////////////////////////////////////")
  call append( 1, "// Copyright(C) Alibaba, T-Head INC.")
  call append( 2, "// ALL RIGHT RESERVED")
  call append( 3, "// File name   : ".expand("%:t"))
  call append( 4, "// Author      : ".g:arg_codespec_author."(".g:arg_codespec_email.")")
  call append( 5, "// Date        : ".strftime("%Y-%m-%d"))
  call append( 6, "// Description :")
  call append( 7, "//    ...")
  call append( 8, "//    ...")
  call append( 9, "// Parameter   :")
  call append(10, "//    ...")
  call append(11, "//    ...")
  call append(12, "// Modification History:")
  call append(13, "//   Date   |   Author   |   Version   |   Change Description")
  call append(14, "//==============================================================================")
  call append(15, "// ".strftime("%Y-%m-%d")." | ".g:arg_codespec_author." | 0.1 | Original Version")
  call append(16, "// ...")
  call append(17, "////////////////////////////////////////////////////////////////////////////////")
endfunction

function s:UpdateModifyHistory()
  for idx in range(50)
    let line = getline(idx+1)
    if line =~ 'Date.*Author.*Version'
      call append(idx+2, "// ".strftime("%Y-%m-%d")." | ".g:arg_codespec_author." | 0.1 | Last Version")
      return
    endif
  endfor
endfunction

function s:InsertAlwaysFf()
  let code = readfile(g:arg_codespec_always_ff)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysComb()
  let code = readfile(g:arg_codespec_always_comb)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysLatch()
  let code = readfile(g:arg_codespec_always_latch)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysAssign()
  let code = readfile(g:arg_codespec_assign)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysCaseInside()
  let code = readfile(g:arg_codespec_case_inside)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysGenerate()
  let code = readfile(g:arg_codespec_generate)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysModule()
  let code = readfile(g:arg_codespec_module)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysPackage()
  let code = readfile(g:arg_codespec_package)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

function s:InsertAlwaysStruct()
  let code = readfile(g:arg_codespec_struct)
  let line = line(".")
  call append(line, code)
  call cursor(line, 0)
endfunction

amenu &T-Head.Code.Insert\ Header<TAB><theader>                 :call <SID>InsertHeader()<CR>
amenu &T-Head.Code.Update\ History<TAB><thistory>               :call <SID>UpdateModifyHistory()<CR>
amenu &T-Head.Code.Insert\ alwyas_ff<TAB><talwyasff>            :call <SID>InsertAlwaysFf()<CR>
amenu &T-Head.Code.Insert\ alwyas_comb<TAB><talwyasff>          :call <SID>InsertAlwaysComb()<CR>
amenu &T-Head.Code.Insert\ alwyas_latch<TAB><talwyasff>         :call <SID>InsertAlwaysLatch()<CR>
amenu &T-Head.Code.Insert\ assign<TAB><talwyasff>         :call <SID>InsertAlwaysAssign()<CR>
amenu &T-Head.Code.Insert\ case_inside<TAB><talwyasff>         :call <SID>InsertAlwaysCaseInside()<CR>
amenu &T-Head.Code.Insert\ generate<TAB><talwyasff>         :call <SID>InsertAlwaysGenerate()<CR>
amenu &T-Head.Code.Insert\ module<TAB><talwyasff>         :call <SID>InsertAlwaysModule()<CR>
amenu &T-Head.Code.Insert\ package<TAB><talwyasff>         :call <SID>InsertAlwaysPackage()<CR>
amenu &T-Head.Code.Insert\ struct<TAB><talwyasff>         :call <SID>InsertAlwaysStruct()<CR>



"nnoremap theader :call <sid>InsertHeader()<cr>
"imap theader <Plug>PrintHead


let &cpo = s:cpo_save

" vim:set sw=2 et:
