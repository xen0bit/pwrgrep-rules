// CWE-611: XXE via DocumentBuilder and SAX without disabling DOCTYPE
import javax.xml.parsers.{DocumentBuilderFactory, SAXParserFactory}
import org.xml.sax.helpers.DefaultHandler

object XxeTest {
  def vuln1() = {
    // ruleid: scala-xxe
    val dbf = DocumentBuilderFactory.newInstance()
    val db = dbf.newDocumentBuilder()
    db.parse("input.xml")
  }
  def vuln2() = {
    // ruleid: scala-xxe
    val spf = SAXParserFactory.newInstance()
    val parser = spf.newSAXParser()
    parser.parse("input.xml", new DefaultHandler())
  }
  def vuln3() = {
    // ruleid: scala-xxe
    val dbf2 = DocumentBuilderFactory.newInstance()
    val builder = dbf2.newDocumentBuilder()
    builder.parse("data.xml")
  }
  def safe1() = {
    // ok: scala-xxe
    val safe = "constant"
    println(safe)
  }
  def safe2() = {
    // ok: scala-xxe
    val safe2 = 42
    println(safe2)
  }
}
