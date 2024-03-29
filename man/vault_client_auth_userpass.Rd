% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vault_client_auth_userpass.R
\name{vault_client_auth_userpass}
\alias{vault_client_auth_userpass}
\title{Vault Username/Password Authentication Configuration}
\description{
Vault Username/Password Authentication Configuration

Vault Username/Password Authentication Configuration
}
\details{
Interact with vault's username/password authentication backend.
This backend can be used to configure basic username+password
authentication, suitable for human users.  For more information,
please see the vault documentation
https://developer.hashicorp.com/vault/docs/auth/userpass
}
\examples{
server <- vaultr::vault_test_server(if_disabled = message)
if (!is.null(server)) {
  root <- server$client()

  # The userpass authentication backend is not enabled by default,
  # so we need to enable it first
  root$auth$enable("userpass")

  # Then we can add users:
  root$auth$userpass$write("alice", "p4ssw0rd")

  # Create a new client and login with this user:
  alice <- vaultr::vault_client(
    addr = server$addr,
    login = "userpass",
    username = "alice",
    password = "p4ssw0rd")

  # (it is not recommended to login with the password like this as
  # it will end up in the command history, but in interactive use
  # you will be prompted securely for password)

  # Alice has now logged in and has only "default" policies
  alice$auth$token$lookup_self()$policies

  # (wheras our original root user has the "root" policy)
  root$auth$token$lookup_self()$policies
}
}
\section{Super class}{
\code{\link[vaultr:vault_client_object]{vaultr::vault_client_object}} -> \code{vault_client_auth_userpass}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-vault_client_auth_userpass-new}{\code{vault_client_auth_userpass$new()}}
\item \href{#method-vault_client_auth_userpass-custom_mount}{\code{vault_client_auth_userpass$custom_mount()}}
\item \href{#method-vault_client_auth_userpass-write}{\code{vault_client_auth_userpass$write()}}
\item \href{#method-vault_client_auth_userpass-read}{\code{vault_client_auth_userpass$read()}}
\item \href{#method-vault_client_auth_userpass-delete}{\code{vault_client_auth_userpass$delete()}}
\item \href{#method-vault_client_auth_userpass-update_password}{\code{vault_client_auth_userpass$update_password()}}
\item \href{#method-vault_client_auth_userpass-update_policies}{\code{vault_client_auth_userpass$update_policies()}}
\item \href{#method-vault_client_auth_userpass-list}{\code{vault_client_auth_userpass$list()}}
\item \href{#method-vault_client_auth_userpass-login}{\code{vault_client_auth_userpass$login()}}
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
\if{html}{\out{<a id="method-vault_client_auth_userpass-new"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-new}{}}}
\subsection{Method \code{new()}}{
Create a \code{vault_client_userpass} object. Not typically
called by users.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$new(api_client, mount)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{api_client}}{A \link{vault_api_client} object}

\item{\code{mount}}{Mount point for the backend}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-custom_mount"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-custom_mount}{}}}
\subsection{Method \code{custom_mount()}}{
Set up a \code{vault_client_auth_userpass} object at a
custom mount.  For example, suppose you mounted the
\code{userpass} authentication backend at \verb{/userpass2} you might
use \code{up <- vault$auth$userpass2$custom_mount("/userpass2")} -
this pattern is repeated for other secret and authentication
backends.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$custom_mount(mount)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{mount}}{String, indicating the path that the engine is mounted at.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-write"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-write}{}}}
\subsection{Method \code{write()}}{
Create or update a user.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$write(
  username,
  password = NULL,
  policies = NULL,
  ttl = NULL,
  max_ttl = NULL,
  bound_cidrs = NULL
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{username}}{Username for the user}

\item{\code{password}}{Password for the user (required when creating a
user only)}

\item{\code{policies}}{Character vector of policies for the user}

\item{\code{ttl}}{The lease duration which decides login expiration}

\item{\code{max_ttl}}{Maximum duration after which login should expire}

\item{\code{bound_cidrs}}{Character vector of CIDRs.  If set,
restricts usage of the login and token to client IPs falling
within the range of the specified CIDR(s).}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-read"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-read}{}}}
\subsection{Method \code{read()}}{
Reads the properties of an existing username.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$read(username)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{username}}{Username to read}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-delete"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-delete}{}}}
\subsection{Method \code{delete()}}{
Delete a user
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$delete(username)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{username}}{Username to delete}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-update_password"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-update_password}{}}}
\subsection{Method \code{update_password()}}{
Update password for a user
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$update_password(username, password)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{username}}{Username for the user to update}

\item{\code{password}}{New password for the user}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-update_policies"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-update_policies}{}}}
\subsection{Method \code{update_policies()}}{
Update vault policies for a user
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$update_policies(username, policies)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{username}}{Username for the user to update}

\item{\code{policies}}{Character vector of policies for this user}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-list"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-list}{}}}
\subsection{Method \code{list()}}{
List users known to vault
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$list()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-vault_client_auth_userpass-login"></a>}}
\if{latex}{\out{\hypertarget{method-vault_client_auth_userpass-login}{}}}
\subsection{Method \code{login()}}{
Log into the vault using username/password
authentication.  Normally you would not call this directly
but instead use \verb{$login} with \code{method = "userpass"} and
proving the \code{username} argument and optionally the \code{password}
argument.  This function returns a vault token but does not
set it as the client token.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{vault_client_auth_userpass$login(username, password = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{username}}{Username to authenticate with}

\item{\code{password}}{Password to authenticate with. If omitted or
\code{NULL} and the session is interactive, the password will be
prompted for.}
}
\if{html}{\out{</div>}}
}
}
}
