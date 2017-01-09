autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#goto_command = "<leader>mg"
let g:jedi#goto_assignments_command = "<leader>ma"
let g:jedi#goto_definitions_command = "<leader>md"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>mu"
let g:jedi#rename_command = "<leader>mr"

"-- Syntastic related stuff
let g:syntastic_python_checkers = ["pylint"]
