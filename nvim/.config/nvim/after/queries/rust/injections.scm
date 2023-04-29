; extends

(call_expression
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#match? @_name "query(_as){0,1}"))
  (arguments (raw_string_literal) @sql)
  (#offset! @sql 1 0 -1 0))
