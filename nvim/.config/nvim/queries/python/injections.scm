; extends

(expression_statement
  (call
  (attribute
    object: (identifier) @_obj (#eq? @_obj "op")
    attribute: (identifier) @_attr (#eq? @_attr "execute"))
  (argument_list
    (string
      (string_content) @injection.content
      (#set! injection.language "sql")))))

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
        (string_content) @injection.content
        (#set! injection.language "sql"))))))))

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
        (string_content) @injection.content
        (#set! injection.language "sql")))))))

; yaml content in python string
(expression_statement
  (assignment
    left: (identifier) @_ident (#match? @_ident ".*__YAML__$")
    right: (string (string_content) @injection.content
    (#set! injection.language "yaml"))))
