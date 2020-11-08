Docker-based [pre-commit](https://pre-commit.com/) hook for auto-formatting SQL files.

Runs [sqlfmt](https://www.cockroachlabs.com/blog/sql-fmt-online-sql-formatter/) - an opinionated SQL formatter based on prettier - 
included in the [CockroachDB](https://www.cockroachlabs.com/) CLI.

# Usage
add the following to your `.pre-commit-config.yaml`:
```yaml
- repo: https://github.com/otosky/pre-commit-sqlfmt
  rev: 1.0
  hooks:
    - id: sqlfmt
```
