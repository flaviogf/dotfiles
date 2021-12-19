" go install golang.org/x/tools/cmd/goimports@latest
" go install github.com/segmentio/golines@latest
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'gofmt', 'goimports', 'golines']

" {
"   "*_test.go": {
"     "test.runner": "",
"     "test.executable": ""
"   }
" }
augroup projections
  autocmd!
  autocmd User ProjectionistActivate let s:executable = projectionist#query('test.runner') |
        \ if len(s:executable) > 0 |
        \   let test#go#runner = s:executable[0][1] |
        \ endif
  autocmd User ProjectionistActivate let s:executable = projectionist#query('test.executable') |
        \ if len(s:executable) > 0 |
        \   let test#go#delve#executable = s:executable[0][1] |
        \ endif
augroup END
