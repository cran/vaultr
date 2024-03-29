vault_request <- function(verb, url, verify, token, namespace, path, ...,
                          body = NULL, wrap_ttl = NULL,
                          to_json = TRUE,
                          allow_missing_token = FALSE) {
  if (!is.null(token)) {
    token <- httr::add_headers("X-Vault-Token" = token)
  } else if (!allow_missing_token) {
    stop("Have not authenticated against vault", call. = FALSE)
  }
  if (!is.null(namespace)) {
    namespace <- httr::add_headers("X-Vault-Namespace" = namespace)
  }
  if (!is.null(wrap_ttl)) {
    assert_is_duration(wrap_ttl)
    wrap_ttl <- httr::add_headers("X-Vault-Wrap-TTL" = wrap_ttl)
  }
  res <- verb(paste0(url, prepare_path(path)), verify, token, namespace,
              httr::accept_json(), wrap_ttl,
              body = body, encode = "json", ...)
  vault_client_response(res, to_json)
}


vault_client_response <- function(res, to_json = TRUE) {
  code <- httr::status_code(res)
  if (code >= 400 && code < 600) {
    if (response_is_json(res)) {
      dat <- response_to_json(res)
      ## https://developer.hashicorp.com/vault/api-docs#error-response
      errors <- list_to_character(dat$errors)
      text <- paste(errors, collapse = "\n")
    } else {
      errors <- NULL
      text <- trimws(httr::content(res, "text", encoding = "UTF-8"))
    }
    stop(vault_error(code, text, errors))
  }

  if (code == 204) {
    res <- NULL
  } else if (to_json) {
    res <- response_to_json(res)
  }
  res
}

vault_error <- function(code, text, errors) {
  if (!nzchar(text)) {
    text <- httr::http_status(code)$message
  }
  type <- switch(as.character(code),
                 "400" = "vault_invalid_request",
                 "401" = "vault_unauthorized",
                 "403" = "vault_forbidden",
                 "404" = "vault_invalid_path",
                 "429" = "vault_rate_limit_exceeded",
                 "500" = "vault_internal_server_error",
                 "501" = "vault_not_initialized",
                 "503" = "vault_down",
                 "vault_unknown_error")
  err <- list(code = code,
              errors = errors,
              message = text)
  class(err) <- c(type, "vault_error", "error", "condition")
  err
}
