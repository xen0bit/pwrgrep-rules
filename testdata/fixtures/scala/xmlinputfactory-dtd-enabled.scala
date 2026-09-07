// XMLInputFactory without disabled entities expands external DTDs (XXE).
// Instantiate it only with the supporting-external-entities switch off;
// plain code without XML parsing is safe.
import javax.xml.stream.XMLInputFactory

object XmlinputfactoryDtd {
  def vuln(): Unit = {
    var f1: XMLInputFactory = null
    // ruleid: xmlinputfactory-dtd-enabled
    f1 = XMLInputFactory.newInstance()
  }
  def vulnAgain(): Unit = {
    var f2: XMLInputFactory = null
    // ruleid: xmlinputfactory-dtd-enabled
    f2 = XMLInputFactory.newFactory()
  }
  def vulnThird(): Unit = {
    var f3: XMLInputFactory = null
    // ruleid: xmlinputfactory-dtd-enabled
    f3 = XMLInputFactory.newInstance()
  }
  def safe(): Unit = {
    // ok: xmlinputfactory-dtd-enabled
    val fixed = "no-xml-parsing"
    // ok: xmlinputfactory-dtd-enabled
    val alsoFixed = "static-content"
    // ok: xmlinputfactory-dtd-enabled
    println("fixed")
  }
}
