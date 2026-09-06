// CWE-532: Insertion of Sensitive Information into Log File
//
// Logging a password or secret exposes it in log files which are often
// world-readable or shipped to third parties.

import org.slf4j.LoggerFactory

object Cwe532Log {
  private val logger = LoggerFactory.getLogger(getClass)

  def leak(password: String, secret: String, apiKey: String): Unit = {
    // ruleid: scala-sensitive-log
    logger.info(password)
    // ruleid: scala-sensitive-log
    logger.debug(secret)
    // ruleid: scala-sensitive-log
    println(apiKey)
  }

  def safe(): Unit = {
    // ok: scala-sensitive-log
    logger.info("user logged in")
    // ok: scala-sensitive-log
    println("request processed")
    // ok: scala-sensitive-log
    logger.debug("redacted")
  }
}
