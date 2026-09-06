/* CWE-434b: fopen/userFilename without basename — unrestricted upload */
#include <stdio.h>
#include <stdlib.h>
#include <libgen.h>

void upload_vuln1(char *userFilename) {
    // ruleid: c-434-upload
    FILE *f = fopen(userFilename, "w");
    (void)f;
}

void upload_vuln2(int argc, char **argv) {
    char *name = argv[1];
    // ruleid: c-434-upload
    FILE *g = fopen(name, "w");
    (void)g;
}

void upload_vuln3() {
    char *userFilename = getenv("UPLOAD_NAME");
    // ruleid: c-434-upload
    FILE *h = fopen(userFilename, "wb");
    (void)h;
}

void upload_safe_basename(char *userFilename) {
    // ok: c-434-upload
    FILE *f = fopen(basename(userFilename), "w");
    (void)f;
}

void upload_safe_fixed() {
    // ok: c-434-upload
    FILE *f = fopen("/tmp/fixed.png", "w");
    (void)f;
}
