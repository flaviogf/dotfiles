let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'rubocop']

let b:ale_linters = ['rubocop']

let test#ruby#runner = 'rspec'

augroup projections
  autocmd!
  autocmd User ProjectionistActivate let s:executable = projectionist#query('rspec.executable') |
        \ if len(s:executable) > 0 |
        \   let test#ruby#rspec#executable = s:executable[0][1] |
        \ endif
augroup END
