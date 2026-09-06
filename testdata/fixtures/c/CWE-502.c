/* CWE-502: Deserialization */
#include <json.h>
#include <yaml.h>
void vuln(const char *user) {
    /* ruleid: c-deserialization */
    json_tokener_parse(user);
    /* ruleid: c-deserialization */
    json_loads(user, 0, NULL);
    /* ruleid: c-deserialization */
    yaml_parser_load(NULL, user);
    /* ok: c-deserialization */
    json_tokener_parse("{\"a\":1}");
    /* ok: c-deserialization */
    json_loads("{\"k\":\"v\"}", 0, NULL);
}
