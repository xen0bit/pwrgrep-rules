/* CWE-798: Use of Hard-coded Credentials.
 *
 * A secret in the source is a secret in every binary built from it, in the
 * repository's whole history, and in the core dump. It cannot be rotated
 * without a release, and `strings` finds it.
 */
#include <stdlib.h>
#include <string.h>
#include <mysql.h>

/* ruleid: c-hardcoded-credential */
#define DB_PASSWORD "hunter2trustno1"
/* ruleid: c-hardcoded-credential */
#define API_TOKEN "ghp_16C7e42F292c6912E7710c838347Ae178B4a"
/* ruleid: c-hardcoded-credential */
static const char *aws_secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY";
/* ruleid: c-hardcoded-credential */
static char admin_passwd[] = "correct-horse-battery";

#define PASSWORD_MAX 64
#define RETRY_LIMIT 3

static const char *key_format = "%s:%s";
static const char *prompt = "enter your password";

int connect_db(MYSQL *conn, const char *host, const char *user)
{
    /* ruleid: c-hardcoded-credential */
    const char *passphrase = "s3kr1t-passphrase";
    /* ruleid: c-hardcoded-credential */
    mysql_real_connect(conn, host, user, "hunter2trustno1", "app", 0, NULL, 0);

    /* ok: c-hardcoded-credential */
    const char *from_env = getenv("APP_PASSWORD");
    /* ok: c-hardcoded-credential */
    char password[PASSWORD_MAX];
    /* ok: c-hardcoded-credential */
    const char *empty_secret = "";
    /* ok: c-hardcoded-credential */
    mysql_real_connect(conn, host, user, from_env, "app", 0, NULL, 0);

    (void)passphrase; (void)key_format; (void)prompt;
    (void)aws_secret_key; (void)admin_passwd;
    return password[0] + (from_env != NULL) + (empty_secret != NULL);
}
