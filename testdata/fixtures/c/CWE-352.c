/* CWE-352: CSRF - CGI POST without token */
#include <stdlib.h>
#include <string.h>

    // ruleid: c-csrf
void handle_post() {
    char *method = getenv("REQUEST_METHOD");
    if (method && strcmp(method, "POST") == 0) {
        char *data = getenv("POST_DATA");
        printf("processing %s\n", data);
    }
}

    // ruleid: c-csrf
void handle_post2() {
    if (strcmp(getenv("REQUEST_METHOD"), "POST") == 0) {
        char *input = getenv("CONTENT");
        handle(input);
    }
}

void safe_post() {
    char *method = getenv("REQUEST_METHOD");
    if (method && strcmp(method, "POST") == 0) {
        char *csrf = getenv("X-CSRF-Token");
        // ok: c-csrf
        if (csrf && strcmp(csrf, "expected") == 0) {
            printf("ok\n");
        }
    }
}

void handle(char *x) {}
