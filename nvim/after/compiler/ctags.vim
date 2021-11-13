if exists("current_compiler")
  finish
endif
let current_compiler = "ctags"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=ctags
CompilerSet errorformat=%f:%l:%m

let &cpo = s:cpo_save
unlet s:cpo_save
