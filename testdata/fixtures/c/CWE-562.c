/* CWE-562: Return of Stack Variable Address.
 *
 * The storage a local lives in belongs to the frame, and the frame is gone by
 * the time the caller reads the pointer. What the caller reads is whatever
 * the next call put there, which is why this fails intermittently and in
 * production rather than in the test that returned immediately.
 */
#include <stdio.h>
#include <string.h>

struct point { int x, y; };

char *format_id(int id)
{
    char text[32];
    snprintf(text, sizeof text, "id-%d", id);
    /* ruleid: c-returns-stack-address */
    return text;
}

int *counter(void)
{
    int n = 0;
    /* ruleid: c-returns-stack-address */
    return &n;
}

char *second_field(const char *line)
{
    char parts[4][32];
    memcpy(parts[0], line, 31);
    /* ruleid: c-returns-stack-address */
    return &parts[1][0];
}

struct point *origin(void)
{
    struct point p = {0, 0};
    /* ruleid: c-returns-stack-address */
    return &p;
}

char *format_id_static(int id)
{
    static char text[32];
    snprintf(text, sizeof text, "id-%d", id);
    /* ok: c-returns-stack-address */
    return text;
}

int *counter_static(void)
{
    static int n = 0;
    /* ok: c-returns-stack-address */
    return &n;
}

char *echo(char *caller_owned)
{
    char scratch[8];
    (void)scratch;
    /* ok: c-returns-stack-address */
    return caller_owned;
}
