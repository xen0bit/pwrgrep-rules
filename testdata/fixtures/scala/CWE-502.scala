// CWE-502: Deserialization of untrusted data via ObjectInputStream
import java.io.{ObjectInputStream, ByteArrayInputStream}
import javax.servlet.http.HttpServletRequest

object DeserializationTest {
  def vuln(request: HttpServletRequest) = {
    val data = request.getParameter("data")
    // ruleid: scala-deserialization
    new ObjectInputStream(new ByteArrayInputStream(data.getBytes())).readObject()
    // ruleid: scala-deserialization
    new ObjectInputStream(request.getInputStream()).readObject()
    val header = request.getHeader("X-Data")
    // ruleid: scala-deserialization
    new ObjectInputStream(new ByteArrayInputStream(header.getBytes())).readUnshared()
  }
  def safe() = {
    // ok: scala-deserialization
    new ObjectInputStream(new ByteArrayInputStream("fixed".getBytes())).readObject()
    // ok: scala-deserialization
    val safeData = "constant"
    new ObjectInputStream(new ByteArrayInputStream(safeData.getBytes())).readObject()
    // ok: scala-deserialization
    new ObjectInputStream(new ByteArrayInputStream("hello".getBytes())).readUnshared()
  }
}
