// CWE-434: File Upload without check
package fixture
import org.springframework.web.multipart.MultipartFile
import java.io.File

class UploadController {
    // ruleid: kotlin-file-upload
    fun uploadVuln(file: MultipartFile) {
        file.transferTo(File("/uploads/" + file.originalFilename))
    }

    // ruleid: kotlin-file-upload
    fun uploadVuln2(file: MultipartFile) {
        val dest = File(file.originalFilename)
        file.transferTo(dest)
    }

    // ruleid: kotlin-file-upload
    fun uploadVuln3(file: MultipartFile) {
        val path = "/tmp/" + file.originalFilename
        file.transferTo(File(path))
    }

    // ruleid: kotlin-file-upload
    fun uploadVuln4(file: MultipartFile) {
        file.transferTo(File(file.originalFilename ?: "default"))
    }

    fun safeUpload(file: MultipartFile) {
        // ok: kotlin-file-upload
        if (file.getSize() > 1048576) throw Exception("too large")
        if (!file.contentType.equals("image/png")) throw Exception("bad type")
        file.transferTo(File("/safe/" + file.originalFilename))
    }

    fun safe2(file: MultipartFile) {
        // ok: kotlin-file-upload
        val size = file.getSize()
        if (size > 0 && file.contentType == "image/jpeg") {
            file.transferTo(File("/tmp/fixed"))
        }
    }

    fun safe3(file: MultipartFile) {
        // ok: kotlin-file-upload
        if (file.isEmpty) throw Exception("empty")
        val allowed = setOf("image/png", "image/jpeg")
        if (file.contentType !in allowed) throw Exception("bad")
        if (file.getSize() > 2000000) throw Exception("large")
        file.transferTo(File("/tmp/" + java.util.UUID.randomUUID().toString()))
    }
}
