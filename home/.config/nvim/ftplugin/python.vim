
let g:jedi#goto_command = "<leader>mg"
let g:jedi#goto_assignments_command = "<leader>ma"
let g:jedi#goto_definitions_command = "<leader>md"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>mu"
let g:jedi#rename_command = "<leader>mr"

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['yapf']
let b:ale_warn_about_trailing_whitespace = 0

"-- Syntastic related stuff
"--let g:syntastic_python_checkers = ["pylint"]
