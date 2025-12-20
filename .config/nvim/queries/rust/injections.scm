; sqlx::query!(r#"..."#, ...)
(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#eq? @_name "query")
  )

  (token_tree
    (raw_string_literal
      (string_content) @injection.content
      (#set! injection.include-children)
      (#set! injection.language "sql")
    )
  )
)

; Inject Rust highlighting for identifiers inside format strings
(macro_invocation
  (token_tree
    (string_literal
      (string_content) @injection.content
      (#set! injection.language "rust")
      (#set! injection.include-children)
    )
  )
)
