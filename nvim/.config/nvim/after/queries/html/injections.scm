; extends

; js highlighting for htmx `hx-on` attribute value
(attribute 
  (attribute_name) @_attr (#match? @_attr "hx-on:.*")
  (quoted_attribute_value (attribute_value) @javascript)
)
