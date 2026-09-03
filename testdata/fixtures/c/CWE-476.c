/* CWE-476: NULL Pointer Dereference.
 *
 * malloc returns NULL when it cannot allocate, and the program that does not
 * ask keeps going as though it had. The dereference that follows is a read or
 * a write through address zero - a crash on a desktop, and on a system where
 * page zero can be mapped, a write to memory the attacker put there.
 */
#include <stdlib.h>
#include <string.h>

struct node {
    int value;
    struct node *next;
};

void unchecked(const char *text, size_t n)
{
    /* ruleid: c-unchecked-allocation */
    char *buf = malloc(n);
    memcpy(buf, text, n);

    /* ruleid: c-unchecked-allocation */
    char *copy = strdup(text);
    copy[0] = 'X';

    /* ruleid: c-unchecked-allocation */
    struct node *head = calloc(1, sizeof *head);
    head->value = 1;

    /* ruleid: c-unchecked-allocation */
    char *grown = realloc(NULL, n * 2);
    strncpy(grown, text, n);
}

void checked(const char *text, size_t n)
{
    /* ok: c-unchecked-allocation */
    char *buf = malloc(n);
    if (buf == NULL)
        return;
    memcpy(buf, text, n);

    /* ok: c-unchecked-allocation */
    char *copy = strdup(text);
    if (!copy) {
        free(buf);
        return;
    }
    copy[0] = 'X';

    /* ok: c-unchecked-allocation */
    struct node *head = calloc(1, sizeof *head);
    if (head)
        head->value = 1;

    /* ok: c-unchecked-allocation */
    char *grown = realloc(NULL, n * 2);
    if (grown != NULL)
        strncpy(grown, text, n);

    free(buf);
}
