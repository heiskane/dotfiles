; extends

; js highlighting for htmx `hx-on` attribute value
(attribute 
  (attribute_name) @_attr (#match? @_attr "hx-on:.*")
  (quoted_attribute_value (attribute_value) @javascript)
)

; angular js highligting
(attribute 
  (attribute_name) @_attr (#match? @_attr "\*ngIf")
  (quoted_attribute_value (attribute_value) @javascript)
)
(attribute 
  (attribute_name) @_attr (#match? @_attr "\*ngFor")
  (quoted_attribute_value (attribute_value) @javascript)
)
