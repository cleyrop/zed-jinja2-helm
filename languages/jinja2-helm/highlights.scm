; Template delimiters
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

; Keywords — scoped to parent nodes to avoid matching inside content

; Direct children of statement
(statement
  ["endfor" "elif" "else" "endif" "endblock" "endwith"
   "endfilter" "endmacro" "endcall" "endset" "endtrans"
   "continue" "break" "debug" "endautoescape"] @keyword)

; Control flow
(if_expression "if" @keyword)
(ternary_expression "if" @keyword)
(ternary_expression "else" @keyword)

; Loops
(for_statement "for" @keyword)
(for_statement "recursive" @attribute)

; Blocks and structure
(block_statement "block" @keyword)
(block_statement "required" @keyword)
(with_statement "with" @keyword)
(filter_statement "filter" @keyword)
(macro_statement "macro" @keyword)
(call_statement "call" @keyword)
(set_statement "set" @keyword)
(do_statement "do" @keyword)
(trans_statement "trans" @keyword)
(pluralize_statement "pluralize" @keyword)
(autoescape_statement "autoescape" @keyword)

; Imports
(include_statement "include" @keyword)
(import_statement "import" @keyword)
(import_from "from" @keyword)
(extends_statement "extends" @keyword)
(import_as "as" @keyword)

; Attributes
(attribute_ignore) @attribute
(attribute_context) @attribute

; Inline statements
(inline
  ["if" "endfor" "elif" "else" "endif" "endblock" "endwith"
   "endfilter" "endmacro" "endcall" "endset" "endtrans"
   "continue" "break" "debug" "endautoescape" "do"
   "include" "import" "set" "for" "with" "call"
   "extends" "macro" "filter" "block" "pluralize"
   "trans" "autoescape"] @keyword)

; Functions
(function_call
  (identifier) @function)

(call_statement "call" @function)

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

; Raw blocks
(raw_start) @keyword
(raw_end) @keyword
(raw_body) @none

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
