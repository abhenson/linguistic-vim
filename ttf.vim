if has('python')
    command! -nargs=1 Python python <args>
elseif has('python3')
    command! -nargs=1 Python python3 <args>
else
    echo "Error: Vim compiled with +python or +python3 required"
    finish
endif

function! TTF()

Python << EOF

import vim # import to be able to interact with vim(see :help python-vim)

buffer = vim.current.buffer[:]
text = [word.strip('(),.:;?!') for line in buffer for word in line.split()]

total = len(text)
unique = len(set(text))
# debug code
# print('total tokens is {}, unique tokens is {}'.format(total, unique))
# print(text)
ttf = round(float(unique) / total, 3)
print('TTF for current buffer is {}'.format(ttf))

EOF

endfunction

command! -nargs=0 TTF call TTF() " make calling the function nicer
