// CWE-798: Hardcoded credentials — long secret written into source
object HardcodedTest {
  // ruleid: scala-hardcoded-credential
  val password = "SuperSecret123!"
  // ruleid: scala-hardcoded-credential
  val apiKey = "aBcD1234EfGh5678IjKlMnOpQrStUvWx"
  // ruleid: scala-hardcoded-credential
  var secret = "MyHardcodedSecretKey123"
  // ok: scala-hardcoded-credential
  val passwordPlaceholder = "changeme"
  // ok: scala-hardcoded-credential
  val apiKeyEnv = System.getenv("API_KEY")
  // ok: scala-hardcoded-credential
  val token = "test"
  // ok: scala-hardcoded-credential
  val short = "abc"
}
