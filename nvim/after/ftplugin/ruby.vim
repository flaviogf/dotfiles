" gem install neovim rubocop rubocop-rspec rubocop-rails

let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'rubocop']
let b:ale_linters = ['rubocop']

" {
"   "spec/*_spec.rb": {
"     "test.runner": "",
"     "test.executable": ""
"   }
" }
augroup projections
  autocmd!
  autocmd User ProjectionistActivate let s:executable = projectionist#query('test.runner') |
        \ if len(s:executable) > 0 |
        \   let test#ruby#runner = s:executable[0][1] |
        \ endif
  autocmd User ProjectionistActivate let s:executable = projectionist#query('test.executable') |
        \ if len(s:executable) > 0 |
        \   let test#ruby#minitest#executable = s:executable[0][1] |
        \   let test#ruby#rails#executable = s:executable[0][1] |
        \   let test#ruby#rspec#executable = s:executable[0][1] |
        \ endif
augroup END
