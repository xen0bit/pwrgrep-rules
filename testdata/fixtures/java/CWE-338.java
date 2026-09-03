package fixture;

// CWE-338: a SecureRandom that was told what to produce.
//
// SecureRandom is the right class and seeding it by hand undoes the whole
// point of it. Constructed with no argument it seeds itself from the
// operating system; constructed with a byte array, or told `setSeed` before
// it has produced anything, it produces exactly the sequence that seed
// determines. A constant seed in the source means every installation of the
// program generates the same session identifiers, the same password reset
// tokens and the same nonces, in the same order, forever.
//
// The clock is the same finding. `System.currentTimeMillis()` is a number an
// attacker can bracket to within a second or two, which is a few thousand
// candidate sequences, which is not a search.
//
// `setSeed` *after* the generator has been used is defined to supplement the
// existing state rather than replace it, and is harmless. This rule cannot
// tell the two apart and reports both, which is the direction that costs a
// false positive rather than a missed key - and the fix for the harmless case
// is to delete a line that was doing nothing.

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

class Cwe338 {

    byte[] tokenFromAFixedSeed() {
        // ruleid: java-securerandom-told-what-to-produce
        SecureRandom random = new SecureRandom("not-actually-random".getBytes());
        byte[] token = new byte[32];
        random.nextBytes(token);
        return token;
    }

    byte[] tokenFromTheClock() throws NoSuchAlgorithmException {
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
        // ruleid: java-securerandom-told-what-to-produce
        random.setSeed(System.currentTimeMillis());
        byte[] token = new byte[32];
        random.nextBytes(token);
        return token;
    }

    byte[] tokenFromAnEmptyArray() {
        // ruleid: java-securerandom-told-what-to-produce
        SecureRandom random = new SecureRandom(new byte[16]);
        byte[] token = new byte[32];
        random.nextBytes(token);
        return token;
    }

    // Seeded by the operating system, which is what the no-argument
    // constructor is for.
    byte[] token() {
        // ok: java-securerandom-told-what-to-produce
        SecureRandom random = new SecureRandom();
        byte[] token = new byte[32];
        random.nextBytes(token);
        return token;
    }

    // A seed the generator produced for itself carries the entropy it had.
    byte[] tokenFromGeneratedSeed() {
        SecureRandom random = new SecureRandom();
        // ok: java-securerandom-told-what-to-produce
        random.setSeed(random.generateSeed(20));
        byte[] token = new byte[32];
        random.nextBytes(token);
        return token;
    }
}
