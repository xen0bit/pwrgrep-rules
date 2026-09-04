// CWE-798: the signing password is in the build script.
//
// The environment variable is the intended path and the literal after the
// elvis is what somebody added to make a local build work. It is then in the
// repository, in every clone, and in the log of any CI job that prints the
// file.
//
// A second environment variable, or a refusal, is the correct fallback and is
// what the ok lines hold.

// ruleid: build-gradle-password-hardcoded
val signingPassword = env["SIGNING_PASSWORD"] ?: "hunter2"

// ruleid: build-gradle-password-hardcoded
val repoToken: String = env["REPO_TOKEN"] ?: "ghp_000000000000000000"

// ok: build-gradle-password-hardcoded
val keystorePassword = env["KEYSTORE_PASSWORD"] ?: env["SIGNING_PASSWORD"]

// ok: build-gradle-password-hardcoded
val apiKey = env["API_KEY"] ?: error("API_KEY is not set")

// ok: build-gradle-password-hardcoded
val buildDirectory = env["BUILD_DIR"] ?: "build"
