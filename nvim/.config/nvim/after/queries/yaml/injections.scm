; extends

(block_mapping_pair
  key: (flow_node) @_file_name (#match? @_file_name ".*\.sh$")
  value: (block_node (block_scalar) @bash
    (#offset! @bash 0 1 0 0)
  )
)

(block_mapping_pair
  key: (flow_node) @_file_name (#match? @_file_name ".*\.conf$")
  value: (block_node (block_scalar) @python
    (#offset! @python 0 1 0 0)
  )
)

(block_mapping_pair
  key: (flow_node) @_file_name (#match? @_file_name ".*\.py$")
  value: (block_node (block_scalar) @python
    (#offset! @python 0 1 0 0)
  )
)
