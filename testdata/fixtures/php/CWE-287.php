<?php
/* CWE-287: Improper Authentication.
 *
 * An LDAP bind with an empty password is an anonymous bind, and most
 * directories accept it and return success. Code that treats "did bind()
 * succeed" as "was the password right" therefore authenticates anyone who
 * submits a blank password.
 */

function login($ds, $dn, $password)
{
    /* ruleid: ldap-bind-without-password */
    ldap_bind($ds, $dn, '');
    /* ruleid: ldap-bind-without-password */
    ldap_bind($ds, $dn, "");
    /* ruleid: ldap-bind-without-password */
    ldap_bind($ds, $dn, NULL);
    /* ruleid: ldap-bind-without-password */
    ldap_bind($ds, $dn);
    /* ruleid: ldap-bind-without-password */
    ldap_bind($ds);

    /* ok: ldap-bind-without-password */
    ldap_bind($ds, $dn, $password);
    /* ok: ldap-bind-without-password */
    ldap_bind_ext($ds, $dn, $password);
}
