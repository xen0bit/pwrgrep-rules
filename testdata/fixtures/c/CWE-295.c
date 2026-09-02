/* CWE-295: Improper Certificate Validation.
 *
 * A TLS handshake with verification switched off still encrypts, still shows
 * a padlock to anything watching for one, and authenticates nobody - so the
 * machine in the middle needs no certificate at all.
 */
#include <curl/curl.h>
#include <openssl/ssl.h>
#include <mbedtls/ssl.h>

void connect_upstream(SSL_CTX *ctx, SSL *ssl, CURL *curl,
                      mbedtls_ssl_config *conf)
{
    /* ruleid: c-tls-verification-disabled */
    SSL_CTX_set_verify(ctx, SSL_VERIFY_NONE, NULL);
    /* ruleid: c-tls-verification-disabled */
    SSL_set_verify(ssl, SSL_VERIFY_NONE, NULL);
    /* ruleid: c-tls-verification-disabled */
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
    /* ruleid: c-tls-verification-disabled */
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0);
    /* ruleid: c-tls-verification-disabled */
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    /* ruleid: c-tls-verification-disabled */
    mbedtls_ssl_conf_authmode(conf, MBEDTLS_SSL_VERIFY_NONE);

    /* ok: c-tls-verification-disabled */
    SSL_CTX_set_verify(ctx, SSL_VERIFY_PEER, NULL);
    /* ok: c-tls-verification-disabled */
    SSL_CTX_set_verify(ctx, SSL_VERIFY_PEER | SSL_VERIFY_FAIL_IF_NO_PEER_CERT, NULL);
    /* ok: c-tls-verification-disabled */
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 1L);
    /* ok: c-tls-verification-disabled */
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 2L);
    /* ok: c-tls-verification-disabled */
    mbedtls_ssl_conf_authmode(conf, MBEDTLS_SSL_VERIFY_REQUIRED);
}
