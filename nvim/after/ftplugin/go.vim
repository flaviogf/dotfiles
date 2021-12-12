" go install golang.org/x/tools/cmd/goimports@latest
" go install github.com/segmentio/golines
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'gofmt', 'goimports', 'golines']
