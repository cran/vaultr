% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vault_client_secrets.R
\name{vault_client_secrets}
\alias{vault_client_secrets}
\title{Vault Secret Configuration}
\description{
Vault Secret Configuration

Vault Secret Configuration
}
\details{
Interact with vault's secret backends.
}
\examples{

server <- vaultr::vault_test_server(if_disabled = message)
if (!is.null(server)) {
  client <- server$client()

  # To remove the default version 1 kv store and replace with a
  # version 2 store:
  client$secrets$disable("/secret")
  client$secrets$enable("kv", "/secret", version = 2)

  # cleanup
  server$kill()
}
}
\section{Super class}{
\code{\link[vaultr:vault_client_object]{vaultr::vault_client_object}} -> \code{vault_client_secrets}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{cubbyhole}}{The cubbyhole backend:
\link{vault_client_cubbyhole}}

\item{\code{kv1}}{The version 1 key-value backend:
\link{vault_client_kv1}}

\item{\code{kv2}}{The version 2 key-value backend:
\link{vault_client_kv2}}

\item{\code{transit}}{The transit backend:
\link{vault_client_transit}}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-vault_client_secrets-new}{\code{vault_client_secrets$new()}}
\item \href{#method-vault_client_secrets-disable}{\code{vault_client_secrets$disable()}}
\item \href{#method-vault_client_secrets-enable}{\code{vault_client_secrets$enable()}}
\item \href{#method-vault_client_secrets-list}{\code{vault_client_secrets$list()}}
\item \href{#method-vault_client_secrets-move}{\code{vault_client_secrets$move()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="vaultr" data-topic="vault_client_object" data-id="format"><a href='../../vaultr/html/vault_client_object.html#method-vault_client_object-format'><code>vaultr::vault_client_object$format()</code></a></span></li>
<li><span class="pkg-link" data-pkg="vaultr" data-topic="vault_client_object" data-id="help"><a href='../../vaultr/html/vault_client_object.html#method-vault_client_object-help'><code>vaultr::vault_client_object$help()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_secrets-new"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_secrets-new}{}}}
\subsection{Method \code{new()}}{
Create a \code{vault_client_secrets} object. Not typically
called by users.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_secrets$new(api_client)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{api_client}}{A \link{vault_api_client} object}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_secrets-disable"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_secrets-disable}{}}}
\subsection{Method \code{disable()}}{
Disable a previously-enabled secret engine
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_secrets$disable(path)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{path}}{Path of the secret engine}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_secrets-enable"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_secrets-enable}{}}}
\subsection{Method \code{enable()}}{
Enable a secret backend in the vault server
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_secrets$enable(
  type,
  path = type,
  description = NULL,
  version = NULL
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{type}}{The type of secret backend (e.g., \code{transit}, \code{kv}).}

\item{\code{path}}{Specifies the path in which to enable the auth
method. Defaults to be the same as \code{type}.}

\item{\code{description}}{Human-friendly description of the backend;
will be returned by \verb{$list()}}

\item{\code{version}}{Used only for the \code{kv} backend, where an integer
is used to select between \link{vault_client_kv1} and
\link{vault_client_kv2} engines.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_secrets-list"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_secrets-list}{}}}
\subsection{Method \code{list()}}{
List enabled secret engines
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_secrets$list(detailed = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{detailed}}{Logical, indicating if detailed output is
wanted.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_secrets-move"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_secrets-move}{}}}
\subsection{Method \code{move()}}{
Move the path that a secret engine is mounted at
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_secrets$move(from, to)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{from}}{Original path}

\item{\code{to}}{New path}
}
\if{html}{\out{</div>}}
}
}
}
