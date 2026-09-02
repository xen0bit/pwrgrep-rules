/* CWE-327: Use of a Broken or Risky Cryptographic Algorithm.
 *
 * The libcrypto spelling of it: the algorithm is a function you call or an
 * EVP_* handle you pass, so the choice is right there in the source.
 */
#include <openssl/des.h>
#include <openssl/evp.h>
#include <openssl/md5.h>
#include <openssl/rc4.h>
#include <openssl/sha.h>

void digest(const unsigned char *in, size_t n, unsigned char *out,
            EVP_MD_CTX *ctx, EVP_CIPHER_CTX *cctx, RC4_KEY *rk,
            DES_key_schedule *ks, const_DES_cblock *key)
{
    MD5_CTX md5;
    SHA_CTX sha;

    /* ruleid: c-broken-crypto-algorithm */
    MD5(in, n, out);
    /* ruleid: c-broken-crypto-algorithm */
    MD5_Init(&md5);
    /* ruleid: c-broken-crypto-algorithm */
    MD4_Init(&md5);
    /* ruleid: c-broken-crypto-algorithm */
    SHA1(in, n, out);
    /* ruleid: c-broken-crypto-algorithm */
    SHA1_Init(&sha);
    /* ruleid: c-broken-crypto-algorithm */
    EVP_DigestInit_ex(ctx, EVP_md5(), NULL);
    /* ruleid: c-broken-crypto-algorithm */
    EVP_DigestInit_ex(ctx, EVP_sha1(), NULL);
    /* ruleid: c-broken-crypto-algorithm */
    EVP_EncryptInit_ex(cctx, EVP_des_ecb(), NULL, NULL, NULL);
    /* ruleid: c-broken-crypto-algorithm */
    EVP_EncryptInit_ex(cctx, EVP_rc4(), NULL, NULL, NULL);
    /* ruleid: c-broken-crypto-algorithm */
    EVP_EncryptInit_ex(cctx, EVP_bf_cbc(), NULL, NULL, NULL);
    /* ruleid: c-broken-crypto-algorithm */
    EVP_EncryptInit_ex(cctx, EVP_aes_128_ecb(), NULL, NULL, NULL);
    /* ruleid: c-broken-crypto-algorithm */
    RC4_set_key(rk, 16, in);
    /* ruleid: c-broken-crypto-algorithm */
    DES_set_key(key, ks);

    /* ok: c-broken-crypto-algorithm */
    SHA256(in, n, out);
    /* ok: c-broken-crypto-algorithm */
    EVP_DigestInit_ex(ctx, EVP_sha256(), NULL);
    /* ok: c-broken-crypto-algorithm */
    EVP_EncryptInit_ex(cctx, EVP_aes_256_gcm(), NULL, NULL, NULL);
    /* ok: c-broken-crypto-algorithm */
    EVP_DigestInit_ex(ctx, EVP_sha3_512(), NULL);
}
