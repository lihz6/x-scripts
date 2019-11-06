### `<commands>`

`<linemand>` ' `<compound>`

### `<linemand>`

`<command>[<sepmand> <command>]...`

### `<command>`

### `<sepmand>`

`;` ' `&` ' `&&` ' `||` ' `|` ' `&|` ' `<newline>`

### `<newline>`

### `<compound>`

```bash
if <condition>; then
  <commands>
elif <condition>; then
  <commands>
...
else
  <commands>
???
fi
```

```bash
case <value> in
  <pattern>)
    <commands>
    ;; ' ;;& ' ;&
  +++
esac
```

```bash
for <name>[ in <words>]; do
  <commands>
done [<redirections>]
```

```bash
for ((exp1; exp2; exp3)); do
  <commands>
done [<redirections>]
```

```bash
while <condition>; do
  <commands>
done [<redirections>]
```

```bash
until <condition>; do
  <commands>
done [<redirections>]
```

```bash
select <name>[ in <words>]; do
  <commands>
done [<redirections>]
```

```bash
<name>() {
  <commands>
} [<redirections>]
```