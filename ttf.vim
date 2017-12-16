if has('python')
    command! -nargs=1 Python python <args>
    " elseif has('python3')
    "     command! -nargs=1 Python python3 <args>
else
    echo "Error: Vim compiled with +python or +python3 required"
    finish
endif
" if !has('python3')
" 	echo "Error: This version of vim isn't compiled with python support"
" 	finish
" endif

function! TTF()

Python << EOF

import vim # import to be able to interact with vim(see :help python-vim)

buffer = vim.current.buffer[:]
text = [line.strip() for line in buffer]

total = len(text)
unique = len(set(text))
ttf = round(float(total) / unique, 3)
print('TTF for current buffer is {}'.format(ttf))

EOF

endfunction

command! -nargs=0 TTF call TTF() " make calling the function nicer
