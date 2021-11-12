let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'rubocop']

let b:ale_linters = ['rubocop']

nnoremap <f5> :!ctags -R --languages=ruby --exclude=.git --exclude=log .<CR>
