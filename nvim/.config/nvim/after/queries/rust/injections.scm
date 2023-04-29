; extends

(call_expression
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#eq? @_name "query"))
  (arguments (raw_string_literal) @sql)
  (#offset! @sql 1 -1 0 0))
