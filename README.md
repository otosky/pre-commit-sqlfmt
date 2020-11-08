Docker-based [pre-commit]() hook for auto-formatting SQL files.

Runs [sqlfmt]() - an opinionated SQL formatter based on prettier - included with the [CockroachDB]() CLI

# Usage
```yaml
- repo: https://github.com/otosky/pre-commit-sqlfmt
  rev: 1.0
  hooks:
    - id: sqlfmt
```
