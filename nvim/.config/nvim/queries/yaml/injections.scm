; extends

(block_mapping_pair
  key: (flow_node) @_file_name (#match? @_file_name ".*\.sh$")
  value: (block_node (block_scalar) @injection.content
    (#offset! @injection.content 0 1 0 0)
    (#set! injection.language "bash")))

(block_mapping_pair
  key: (flow_node) @_file_name (#match? @_file_name ".*\.conf$")
  value: (block_node (block_scalar) @injection.content  
    (#offset! @injection.content 0 1 0 0)
    (#set! injection.language "python")))

(block_mapping_pair
  key: (flow_node) @_file_name (#match? @_file_name ".*\.py$")
  value: (block_node (block_scalar) @injection.content
    (#offset! @injection.content 0 1 0 0)
    (#set! injection.language "python")))
