// RSA without OAEP padding is malleable. Request OAEP explicitly instead
// of NoPadding.
object RsaPaddingSet {
  def vuln(): Unit = {
    var c1: javax.crypto.Cipher = null
    // ruleid: rsa-padding-set
    c1 = javax.crypto.Cipher.getInstance("RSA/ECB/NoPadding")
  }
  def vulnAgain(): Unit = {
    var c2: javax.crypto.Cipher = null
    // ruleid: rsa-padding-set
    c2 = javax.crypto.Cipher.getInstance("RSA/None/NoPadding")
  }
  def vulnThird(): Unit = {
    var c3: javax.crypto.Cipher = null
    // ruleid: rsa-padding-set
    c3 = javax.crypto.Cipher.getInstance("RSA/ECB/NoPadding")
  }
  def safe(): Unit = {
    var c1: javax.crypto.Cipher = null
    // ok: rsa-padding-set
    c1 = javax.crypto.Cipher.getInstance("RSA/ECB/OAEPWithSHA-256AndMGF1Padding")
    var c2: javax.crypto.Cipher = null
    // ok: rsa-padding-set
    c2 = javax.crypto.Cipher.getInstance("AES/GCM/NoPadding")
    // ok: rsa-padding-set
    val fixed = "RSA/ECB/OAEPWithSHA-256AndMGF1Padding"
  }
}
