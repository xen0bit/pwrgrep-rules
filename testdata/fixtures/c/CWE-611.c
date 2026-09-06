/* CWE-611: XXE */
#include <libxml/parser.h>
#include <expat.h>
void vuln(const char *user, const char *buf, XML_Parser p) {
    /* ruleid: c-xxe */
    xmlReadFile(user, NULL);
    /* ruleid: c-xxe */
    xmlReadMemory(buf, 100, user, NULL, 0);
    /* ruleid: c-xxe */
    XML_Parse(p, user, 100);
    /* ok: c-xxe */
    xmlReadFile("/tmp/fixed.xml", NULL);
    /* ok: c-xxe */
    XML_Parse(p, "<root>hi</root>", 14);
}
