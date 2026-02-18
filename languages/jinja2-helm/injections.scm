; Inject YAML highlighting into content nodes (text between Jinja2 tags)
((content) @injection.content
  (#set! injection.language "YAML")
  (#set! injection.include-children true))
