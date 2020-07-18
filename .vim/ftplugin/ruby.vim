" Overwrite the default rspec command to user bundle
let g:rspec_command = "VimuxRunCommand('bundle exec rspec {spec}')"

nnoremap <buffer> <leader>t :call RunCurrentSpecFile()<CR>
nnoremap <buffer> <leader>f :call RunNearestSpec()<CR>
nnoremap <buffer> <leader>r :VimuxRunCommand("bundle exec rubocop -a " . expand("%"))<CR>
