let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'rubocop']

let b:ale_linters = ['rubocop']

nnoremap <f5> :!git ls-files --exclude-standard \| ctags -R --languages=ruby<CR>
