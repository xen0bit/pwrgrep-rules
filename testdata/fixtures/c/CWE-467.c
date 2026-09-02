/* CWE-467: Use of sizeof() on a Pointer Type.
 *
 * sizeof asks the type how big it is, and the type of a pointer is a pointer:
 * the answer is 4 or 8 whatever it points at. Written where a buffer length
 * belongs it silently becomes the word size, so the clear clears eight bytes,
 * the read reads eight, and the allocation is eight bytes long.
 *
 * An array decays to a pointer when it is passed, which is why the same line
 * is correct in the function that declared the array and wrong in the one
 * that received it.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct session { char key[32]; int id; };

void wipe(char *secret)
{
    /* ruleid: c-sizeof-on-pointer */
    memset(secret, 0, sizeof(secret));
}

void load(int fd, char *into, size_t room)
{
    /* ruleid: c-sizeof-on-pointer */
    read(fd, into, sizeof(into));
    /* ok: c-sizeof-on-pointer */
    read(fd, into, room);
}

void copy_line(FILE *f)
{
    char *line = malloc(256);
    /* ruleid: c-sizeof-on-pointer */
    fgets(line, sizeof(line), f);
    /* ruleid: c-sizeof-on-pointer */
    memset(line, 0, sizeof(line));

    struct session *s;
    /* ruleid: c-sizeof-on-pointer */
    s = malloc(sizeof(s));

    char here[256];
    /* ok: c-sizeof-on-pointer */
    fgets(here, sizeof(here), f);
    /* ok: c-sizeof-on-pointer */
    memset(here, 0, sizeof(here));
    /* ok: c-sizeof-on-pointer */
    s = malloc(sizeof(*s));
    /* ok: c-sizeof-on-pointer */
    s = malloc(sizeof(struct session));
    free(line);
}
