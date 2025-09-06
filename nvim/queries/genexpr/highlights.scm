(identifier) @variable
(number) @number
(string) @string
(comment) @comment

(function_definition
    (identifier) @function)

(function_call
    (identifier) @function.call)

(param_declaration
  "Param" @attribute
  (identifier) @variable)

(history_declaration
  "History" @property
  (number) @number)

(data_declaration
  "Data" @attribute
  (identifier) @variable)

(buffer_declaration
  "Buffer" @property
  (identifier) @variable)

(assignment
    "=" @operator)

(compound_assignment
    ["+=" "-=" "*=" "/="] @operator)

(binary_expression
    ["+" "-" "*" "/" "==" "<" ">" "<=" ">="] @operator)

(for_statement
    "for" @keyword
    ";" @punctuation.delimiter)

(if_statement
    "if" @keyword
    "else" @keyword)

(return_statement
    "return" @keyword)
