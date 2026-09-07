// SAX parsing without disabled entities expands external DTDs (XXE).
// Chaining newInstance with newSAXParser and no setFeature calls leaves
// entity processing on.
import javax.xml.parsers.SAXParserFactory
import javax.xml.parsers.SAXParser

object SaxDtd {
  def vuln(): Unit = {
    var sp1: SAXParser = null
    // ruleid: sax-dtd-enabled
    sp1 = SAXParserFactory.newInstance().newSAXParser()
  }
  def vulnAgain(): Unit = {
    var sp2: SAXParser = null
    // ruleid: sax-dtd-enabled
    sp2 = SAXParserFactory.newInstance().newSAXParser()
  }
  def vulnThird(): Unit = {
    var sp3: SAXParser = null
    // ruleid: sax-dtd-enabled
    sp3 = SAXParserFactory.newInstance().newSAXParser()
  }
  def safe(): Unit = {
    // ok: sax-dtd-enabled
    val fixed = "no-xml-parsing"
    // ok: sax-dtd-enabled
    val alsoFixed = "static-content"
    // ok: sax-dtd-enabled
    println("fixed")
  }
}
