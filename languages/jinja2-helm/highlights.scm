; Template delimiters — render expressions {{ }}, control blocks {% %}, comments {# #}
[
  "{{"
  "{{-"
  "{{+"
  "+}}"
  "-}}"
  "}}"
  "{%"
  "{%-"
  "{%+"
  "+%}"
  "-%}"
  "%}"
] @punctuation.special

"{#" @comment
"#}" @comment

; Literals
(string_literal) @string
(number_literal) @number
(float_literal) @number
(boolean_literal) @boolean
(null_literal) @constant

; Comments
(comment) @comment

; Punctuation
[
  ","
  "."
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

; Operators
(binary_operator) @operator
"|" @operator
"~" @operator

; Keywords — control flow
[
  "if"
  "else"
  "endif"
  "elif"
] @keyword

; Keywords — loops
[
  "for"
  "in"
  "continue"
  "break"
  "endfor"
] @keyword

; Keywords — blocks and structure
[
  "block"
  "endblock"
  "with"
  "endwith"
  "filter"
  "endfilter"
  "macro"
  "endmacro"
  "call"
  "endcall"
  "set"
  "endset"
  "trans"
  "endtrans"
  "pluralize"
  "autoescape"
  "endautoescape"
  "required"
] @keyword

; Keywords — imports
[
  "include"
  "import"
  "from"
  "extends"
  "as"
] @keyword

; Attributes
[
  (attribute_ignore)
  (attribute_context)
  "recursive"
] @attribute

; Functions
(function_call
  (identifier) @function)

"call" @function

; Variables and parameters
(import_statement
  (identifier) @variable)

(import_as
  (identifier) @variable)

(arg
  (identifier) @variable.parameter)

; Member access  foo.bar
(expression
  "."
  (expression)+ @property)

(assignment_expression
  "."
  (identifier)+ @property)

; Builtins
(inline_trans
  "_" @function.builtin)

"debug" @function.builtin
"defined" @constant

; Raw blocks — important for Go template escaping in Helm
(raw_start) @keyword
(raw_end) @keyword
(raw_body) @string.special

; Builtin tests (is defined, is none, etc.)
(builtin_test
  [
    "boolean"
    "even"
    "in"
    "mapping"
    "sequence"
    "callable"
    "integer"
    "ne"
    "string"
    "defined"
    "filter"
    "iterable"
    "none"
    "test"
    "divisibleby"
    "float"
    "le"
    "number"
    "eq"
    "ge"
    "lower"
    "odd"
    "undefined"
    "escaped"
    "gt"
    "lt"
    "sameas"
    "upper"
  ] @keyword)
