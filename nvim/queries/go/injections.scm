; c.String(http.StatusOK, `...`)
(call_expression
  (selector_expression
    operand: (identifier) @_operand (#eq? @_operand "c")
    field: (field_identifier) @_field (#eq? @_field "String"))
  (argument_list
    (raw_string_literal) @injection.content
    (#set! injection.include-children)
    (#set! injection.language "html")))

; fmt.Sprintf(`...`)
(call_expression
  (selector_expression
    operand: (identifier) @_operand (#eq? @_operand "fmt")
    field: (field_identifier) @_field (#eq? @_field "Sprintf"))

  (argument_list
    (raw_string_literal) @injection.content 
    (#set! injection.include-children)
    (#set! injection.language "html")))
