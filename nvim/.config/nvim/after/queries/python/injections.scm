; extends
(expression_statement
  (call
  (attribute
    object: (identifier) @_obj (#eq? @_obj "op")
    attribute: (identifier) @_attr (#eq? @_attr "execute"))
  (argument_list
    (string
      (string_content) @sql)
)))
