augroup go_format
	autocmd!
	autocmd BufWritePre *.go silent! execute "%!gofmt -s"
augroup END

inoremap <buffer> ` ``<LEFT>

iunmap '

packadd vim-goimports
