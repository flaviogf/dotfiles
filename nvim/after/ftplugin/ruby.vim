let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'rubocop']

let b:ale_linters = ['rubocop']

let test#ruby#runner = 'rspec'
let test#ruby#rspec#executable = 'docker-compose exec app bundle exec rspec'
