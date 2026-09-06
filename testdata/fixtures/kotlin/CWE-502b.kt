// CWE-502: Deserialization via ObjectInputStream
package fixture
import java.io.ObjectInputStream
import java.io.ByteArrayInputStream
import javax.servlet.http.HttpServletRequest

class DeserTest {
    fun vuln(request: HttpServletRequest) {
        val data = request.getParameter("data")
        // ruleid: kotlin-deserialization
        ObjectInputStream(ByteArrayInputStream(data.toByteArray())).readObject()
    }

    fun vulnHeader(request: HttpServletRequest) {
        // ruleid: kotlin-deserialization
        ObjectInputStream(ByteArrayInputStream(request.getHeader("X-Data").toByteArray())).readUnshared()
    }

    fun vulnIntent(intent: android.content.Intent) {
        val extra = intent.getStringExtra("extra")
        // ruleid: kotlin-deserialization
        ObjectInputStream(ByteArrayInputStream(extra.toByteArray())).readObject()
    }

    fun safe() {
        // ok: kotlin-deserialization
        ObjectInputStream(ByteArrayInputStream("fixed".toByteArray())).readObject()
    }
}
