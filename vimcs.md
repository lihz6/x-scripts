### Global

- `.` - repeat last command
- `ESC` - reset normal mode

### Cursor movement

- `h` - move cursor left
- `j` - jump cursor down
- `k` - jump cursor up
- `l` - move cursor right

<br/>

- `w` - jump forwards to the start of a word
- `W` - jump forwards to the start of a word (words can contain punctuation)
- `e` - jump forwards to the end of a word
- `E` - jump forwards to the end of a word (words can contain punctuation)
- `b` - jump backwards to the start of a word
- `B` - jump backwards to the start of a word (words can contain punctuation)

<br/>

- `^` - move to the first non-blank character of the line
- `$` - move to the end of the line
- `0` - move to the start of the line
- `g_` - move to the last non-blank character of the line

<br/>

- `gg` - go to the first line of the document
- `G` - go to the last line of the document
- `Ctrl + g` - show which line cursor in
- `5G` - go to line 5

<br/>

- `fx` - move to next occurrence of character x
- `tx` - move to before next occurrence of character x
- `Fx` - move to previous occurence of character x
- `Tx` - move to after previous occurence of character x
- `;` - repeat previous f, t, F or T movement
- `,` - repeat previous f, t, F or T movement, backwards

<br/>

- `%` - jump to matching character (default supported pairs: `()`, `{}`, `[]` - use `:h matchpairs` in vim for more info)
- `}` - jump to next paragraph (or function/block, when editing code)
- `{` - jump to previous paragraph (or function/block, when editing code)

> **Tip** Prefix a cursor movement command with a number to repeat it. For example, `4j` moves down 4 lines.

### Screen movement

- `Ctrl + e` - move down one line (without moving cursor)
- `Ctrl + y` - move up one line (without moving cursor)
- `Ctrl + b` - move down one full screen
- `Ctrl + f` - move up one full screen
- `Ctrl + d` - move down 1/2 a screen
- `Ctrl + u` - move up 1/2 a screen

<br/>

- `H` - jump to the first non-blank character of the first line of screen
- `M` - jump to the first non-blank character of the middle line of screen
- `L` - jump to the first non-blank character of the last line of screen
- `zz` - jump and center cursor on screen

> **Note** Cursor moves to the first non-blank character.

### Insert mode

- `i` - insert before the cursor
- `I` - insert at the beginning of the line
- `a` - insert (append) after the cursor
- `A` - insert (append) at the end of the line
- `o` - append (open) a new line below the current line
- `O` - append (open) a new line above the current line
- `c + motion` - change and insert
- `cc` - change (replace) entire line
- `C` - change (replace) to the end of the line
- `ciw` - change entire word
- `s` - delete and insert

### Editing text

- `r` - replace a single character
- `R` - replace a single character
- `x` - delete a single character
- `X` - delete a single character
- `~` - switch case
- `u` - undo
- `U` - undo
- `Ctrl + r` - redo
- `xp` - transpose two character
- `d + motion` - delete
- `dd` - delete a line
- `D` - delete to the end of the line
- `y` - yank
- `yy` - yank a line
- `p` - put after cursor
- `P` - put before cursor
