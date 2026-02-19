# Jinja2 Helm — Zed Extension

Syntax highlighting for **Jinja2-templated Helm/YAML files**, designed for [Copier](https://copier.readthedocs.io/) + [Helmfile](https://helmfile.readthedocs.io/) workflows.

Handles files where Jinja2 wraps YAML and Go template (Helm) syntax — a common pattern when using Copier to generate Helmfile values.

## Features

- Jinja2 syntax highlighting for control blocks (`{% if %}`, `{% for %}`, `{% set %}`, etc.)
- YAML highlighting injected between Jinja2 tags
- Helm/Go template highlighting inside `{% raw %}...{% endraw %}` blocks
- Bracket auto-closing for `{{ }}`, `{% %}`, `{# #}`
- YAML keywords like `true`, `false`, `null`, `if`, `in` in content don't break highlighting

## Supported File Extensions

| Pattern | Use case |
|---|---|
| `*.yaml.gotmpl.jinja` | Copier + Helmfile values |
| `*.yml.gotmpl.jinja` | Copier + Helmfile values |
| `*.gotmpl.jinja` | Copier + Helmfile templates |
| `*.yaml.jinja`, `*.yml.jinja` | Copier / Ansible YAML |
| `*.yaml.j2`, `*.yml.j2` | Jinja2 YAML |
| `.copier-answers.yml.jinja` | Copier config |

## Installation

### From Git (dev extension)

```bash
git clone https://github.com/cleyrop/zed-jinja2-helm
```

In Zed: **Extensions > Install Dev Extension** and select the cloned folder.

### Prerequisites

The [Helm](https://github.com/nicholastmosher/zed-helm) extension must be installed for Go template highlighting inside `{% raw %}` blocks. Install it from **Zed > Extensions** by searching "Helm".

## Recommended Zed Settings

Add file type associations in your Zed `settings.json` to ensure files are detected correctly:

```json
{
  "file_types": {
    "Jinja2 Helm": [
      "*.yaml.gotmpl.jinja",
      "*.yml.gotmpl.jinja",
      "*.gotmpl.jinja",
      "*.yaml.jinja",
      "*.yml.jinja",
      "**/.copier-answers.yml.jinja"
    ]
  }
}
```

## Example

A typical Copier + Helmfile values file:

```yaml
{%- if sizing == 'micro' %}
replicas: 1
{%- else %}
replicas: 3
{%- endif %}

ingress:
  enabled: true
  hosts:
    - 'app.{% raw %}{{ env "DOMAIN" }}{% endraw %}'
```

This extension highlights:
- `{%- if %}`, `{%- else %}`, `{%- endif %}` as Jinja2 control blocks
- `replicas: 1`, `ingress:`, `enabled: true` as YAML
- `{{ env "DOMAIN" }}` inside raw blocks as Helm/Go template

## Grammar

Uses a [fork](https://github.com/jean-humann/tree-sitter-jinja) of [tree-sitter-jinja](https://github.com/cathaysia/tree-sitter-jinja) with an external scanner that handles content parsing between Jinja2 tags. This prevents tree-sitter's keyword matching from interfering with YAML content.

## License

MIT
