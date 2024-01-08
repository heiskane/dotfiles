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

; async session.execute calls with raw sql
(expression_statement
  (await
  (call
  (attribute
    object: (identifier) @_obj (#eq? @_obj "session")
    attribute: (identifier) @_attr (#eq? @_attr "execute"))
  (argument_list
    (call (identifier) @_ident (#eq? @_ident "text")
    (argument_list
      (string 
        (string_content) @sql))
)))))

; sync session.execute calls with raw sql
(expression_statement
  (call
  (attribute
    object: (identifier) @_obj (#eq? @_obj "session")
    attribute: (identifier) @_attr (#eq? @_attr "execute"))
  (argument_list
    (call (identifier) @_ident (#eq? @_ident "text")
    (argument_list
      (string 
        (string_content) @sql))
))))
