; extends

((redirected_statement
  redirect: (heredoc_redirect (heredoc_start) @_eof (#eq? @_eof "EOFSQL")))
 (heredoc_body) @sql (#offset! @sql 0 0 -1 0)
)
