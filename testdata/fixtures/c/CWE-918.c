/* CWE-918: SSRF via curl */
#include <curl/curl.h>
void vuln(CURL *ch, const char *user) {
    /* ruleid: c-ssrf */
    curl_easy_setopt(ch, CURLOPT_URL, user);
    /* ruleid: c-ssrf */
    curl_easy_setopt(ch, CURLOPT_URL, user);
    /* ok: c-ssrf */
    curl_easy_setopt(ch, CURLOPT_URL, "https://example.com");
    /* ok: c-ssrf */
    curl_easy_setopt(ch, CURLOPT_URL, "https://api.example.com/health");
}
void vuln2(CURL *ch, const char *input) {
    /* ruleid: c-ssrf */
    curl_easy_setopt(ch, CURLOPT_URL, input);
    /* ruleid: c-ssrf */
    curl_easy_setopt(ch, CURLOPT_URL, input);
}
void safe2(CURL *ch) {
    /* ok: c-ssrf */
    curl_easy_setopt(ch, CURLOPT_URL, "https://allowlist.example.com");
}
