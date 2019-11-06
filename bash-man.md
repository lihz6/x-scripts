metacharacter

- `space`
- `tab`
- `newline`
- `|`
- `&`
- `;`
- `(`
- `)`
- `<`
- `>`

control operator

- `newline`
- `||`
- `&&`
- `&`
- `;`
- `;;`
- `;&`
- `;;&`
- `|`
- `|&`
- `(`
- `)`

redirection operator

- `>word`
- `>/dev/null`
- `<word`
- `&>word`
- `&>>word`
- `<<[-]word`


building blocks

- commands
- control structures
- shell functions
- shell parameters
- shell expansions
- redirections


The following is a brief description of the shell’s operation when it reads and executes a command. Basically, the shell does the following:

1. Reads its input from a file (see Shell Scripts), from a string supplied as an argument to the -c invocation option (see Invoking Bash), or from the user’s terminal.
2. Breaks the input into words and operators, obeying the quoting rules described in Quoting. These tokens are separated by metacharacters. Alias expansion is performed by this step (see Aliases).
3. Parses the tokens into simple and compound commands (see Shell Commands).
4. Performs the various shell expansions (see Shell Expansions), breaking the expanded tokens into lists of filenames (see Filename Expansion) and commands and arguments.
5. Performs any necessary redirections (see Redirections) and removes the redirection operators and their operands from the argument list.
6. Executes the command (see Executing Commands).
7. Optionally waits for the command to complete and collects its exit status (see Exit Status).

quoting
- escape character
  - `\newline` is treated as a line continuation.
- single quotes
  - A single quote may not occur between single quotes, even when preceded by a backslash.
- double quotes
  - `$<expression>`
  - <code>\`\<expression\>\`</code>
  - `!<expression>`
  - <code>\\[$\`!]</code>
  - `*`, `@`

  commands
  - single commands
  - pipelines `[time [-p]] [!] command1 [ | or |& command2 ] ...`
  - lists of commands `;` `&` `&&` `||`