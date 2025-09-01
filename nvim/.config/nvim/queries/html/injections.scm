; extends

; js highlighting for htmx `hx-on` attribute value
(attribute 
  (attribute_name) @_attr (#match? @_attr "^hx-on:.*$")
  (quoted_attribute_value (attribute_value) @injection.content
  (#set! injection.language "javascript"))
)

; highlighting for htmx `hx-vals` attribute

; the parsing shows a bunch of errors but looks just fine
(attribute 
  (attribute_name) @_attr (#match? @_attr "^hx-vals")
  (quoted_attribute_value
    (attribute_value) @injection.content
    (#match? @injection.content "^js:")
    (#offset! @injection.content 0 3 0 0)
    (#set! injection.language "javascript")))

(attribute 
  (attribute_name) @_attr (#match? @_attr "^hx-vals")
  (quoted_attribute_value
    (attribute_value) @injection.content
    (#set! injection.language "json")))

; angular js highlighting
(attribute 
  (attribute_name) @_attr (#match? @_attr "\*ngIf")
  (quoted_attribute_value (attribute_value) @injection.content
  (#set! injection.language "javascript"))
)

(attribute 
  (attribute_name) @_attr (#match? @_attr "\*ngFor")
  (quoted_attribute_value (attribute_value) @injection.content
  (#set! injection.language "javascript"))
)
