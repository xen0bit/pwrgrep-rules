// CWE-295: Improper Certificate Validation - disabled verification
//
// TrustManager that does nothing or SSLContext initialized with null trust
// disables certificate verification.

import javax.net.ssl.{SSLContext, X509TrustManager}
import java.security.cert.X509Certificate

object Cwe295Tls {
  def insecure1(): Unit = {
    val tm = new X509TrustManager {
      def getAcceptedIssuers(): Array[X509Certificate] = Array.empty
      def checkClientTrusted(chain: Array[X509Certificate], authType: String): Unit = {}
      def checkServerTrusted(chain: Array[X509Certificate], authType: String): Unit = {}
    }
    // ruleid: scala-tls-insecure
    SSLContext.getInstance("TLS").init(null, Array(tm), null)
  }

  def insecure2(): Unit = {
    // ruleid: scala-tls-insecure
    SSLContext.getInstance("SSL").init(null, null, null)
  }

  def insecure3(): Unit = {
    // ruleid: scala-tls-insecure
    SSLContext.getInstance("TLSv1").init(null, Array.empty, null)
  }

  def safe(): Unit = {
    // ok: scala-tls-insecure
    val ctx = SSLContext.getInstance("TLSv1.2")
    ctx.init(null, null, new java.security.SecureRandom())
    // ok: scala-tls-insecure
    SSLContext.getInstance("TLSv1.3")
    // ok: scala-tls-insecure
    val safeTm = new X509TrustManager {
      def getAcceptedIssuers(): Array[X509Certificate] = Array.empty
      def checkClientTrusted(chain: Array[X509Certificate], authType: String): Unit = throw new Exception()
      def checkServerTrusted(chain: Array[X509Certificate], authType: String): Unit = throw new Exception()
    }
  }
}
