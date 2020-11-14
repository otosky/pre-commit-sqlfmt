Docker-based [pre-commit](https://pre-commit.com/) hook for auto-formatting SQL files.

Runs [sqlfmt](https://www.cockroachlabs.com/blog/sql-fmt-online-sql-formatter/) - an opinionated SQL formatter based on prettier - 
included in the [CockroachDB](https://www.cockroachlabs.com/) CLI.

# Usage
add the following to your `.pre-commit-config.yaml`:
```yaml
- repo: https://github.com/otosky/pre-commit-sqlfmt
  rev: v1.2
  hooks:
    - id: sqlfmt
      # if adding args, uncomment:
      #args: ["--use-spaces", "--print-width", "45"]
```
Args for `sqlfmt` can be found here: https://www.cockroachlabs.com/docs/v20.1/cockroach-sqlfmt.html
