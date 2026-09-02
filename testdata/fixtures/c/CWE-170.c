/* CWE-170: Improper Null Termination.
 *
 * strncpy is not a bounded strcpy. It writes exactly n bytes: padding with
 * NULs when the source is short, and writing no terminator at all when the
 * source is n bytes or longer. Sized with the whole destination, it leaves a
 * buffer that every str* function afterwards runs off the end of.
 */
#include <string.h>

void copy_field(const char *src, const wchar_t *wsrc, char *out, size_t outlen)
{
    char name[32];
    char label[32];
    char note[32];
    char tail[32];
    wchar_t wide[32];

    /* ruleid: c-missing-null-terminator */
    strncpy(name, src, sizeof(name));
    /* ruleid: c-missing-null-terminator */
    strncpy(label, src, sizeof label);
    /* ruleid: c-missing-null-terminator */
    strncat(tail, src, sizeof(tail));
    /* ruleid: c-missing-null-terminator */
    wcsncpy(wide, wsrc, sizeof(wide));

    /* ok: c-missing-null-terminator */
    strncpy(note, src, sizeof(note) - 1);
    note[sizeof(note) - 1] = '\0';
    /* ok: c-missing-null-terminator */
    strncpy(out, src, outlen);
    out[outlen - 1] = '\0';
    /* ok: c-missing-null-terminator */
    strlcpy(name, src, sizeof(name));
    /* ok: c-missing-null-terminator */
    snprintf(label, sizeof(label), "%s", src);
}
