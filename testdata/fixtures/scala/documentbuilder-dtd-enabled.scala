// DocumentBuilder without disabled entities expands external DTDs (XXE).
// Chaining newInstance with newDocumentBuilder and no setFeature calls
// leaves entity processing on.
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.parsers.DocumentBuilder

object DocumentbuilderDtd {
  def vuln(): Unit = {
    var db1: DocumentBuilder = null
    // ruleid: documentbuilder-dtd-enabled
    db1 = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  }
  def vulnAgain(): Unit = {
    var db2: DocumentBuilder = null
    // ruleid: documentbuilder-dtd-enabled
    db2 = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  }
  def vulnThird(): Unit = {
    var db3: DocumentBuilder = null
    // ruleid: documentbuilder-dtd-enabled
    db3 = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  }
  def safe(): Unit = {
    // ok: documentbuilder-dtd-enabled
    val fixed = "no-xml-parsing"
    // ok: documentbuilder-dtd-enabled
    val alsoFixed = "static-content"
    // ok: documentbuilder-dtd-enabled
    println("fixed")
  }
}
