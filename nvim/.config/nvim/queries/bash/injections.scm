; extends

(redirected_statement
  redirect: (heredoc_redirect (heredoc_start) @_eof (#eq? @_eof "EOFSQL")
 (heredoc_body) @injection.content
 (#set! injection.language "sql"))
)
