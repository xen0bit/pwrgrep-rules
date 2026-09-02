/* CWE-416: Use After Free.
 *
 * free() ends the block's life and says nothing about the pointer, which
 * still holds the address. The allocator reuses that memory for the next
 * request, so a read through the stale pointer reads someone else's data and
 * a write through it writes into someone else's object - which is why this is
 * an exploitation primitive and not merely a crash.
 */
#include <stdlib.h>
#include <string.h>

struct session {
    char *name;
    int id;
};

void handle(struct session *s, const char *text)
{
    char *buf = malloc(64);
    free(buf);
    /* ruleid: c-use-after-free */
    strcpy(buf, text);

    char *note = malloc(64);
    free(note);
    /* ruleid: c-use-after-free */
    memcpy(note, text, 8);

    free(s);
    /* ruleid: c-use-after-free */
    s->id = 1;

    struct session *t = malloc(sizeof *t);
    free(t);
    /* ruleid: c-use-after-free */
    t->name = NULL;
}

char *handle_properly(const char *text)
{
    char *buf = malloc(64);
    free(buf);
    buf = malloc(128);
    /* ok: c-use-after-free */
    strcpy(buf, text);

    char *note = malloc(64);
    free(note);
    note = NULL;
    /* ok: c-use-after-free */
    if (note != NULL)
        strcpy(note, text);

    char *keep = malloc(64);
    /* ok: c-use-after-free */
    strcpy(keep, text);
    free(keep);

    return buf;
}
