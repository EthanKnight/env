if did_filetype()
    finish
elseif getline(1) =~# '#!.*python.*'
    set filetype=python
    set syntax=python
elseif getline(1) =~# '#!.*bash.*'
    set filetype=bash
    set syntax=bash
endif
