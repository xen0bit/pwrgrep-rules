// CWE-434: FileManager createFile without ext check
import Foundation

func vuln1(uploadedFile: (name: String, data: Data)) {
    let name = uploadedFile.name
    // ruleid: swift-434-upload
    FileManager.default.createFile(atPath: "/uploads/" + name, contents: uploadedFile.data)
}

func vuln2(file: (filename: String, content: Data)) {
    let path = "/tmp/" + file.filename
    // ruleid: swift-434-upload
    FileManager.default.createFile(atPath: path, contents: file.content)
}

func vuln3(requestData: (fileName: String, bytes: Data)) {
    let p = requestData.fileName
    // ruleid: swift-434-upload
    Data.write(to: URL(fileURLWithPath: p))
}

func safeAllowlist(uploadedFile: (name: String, data: Data)) {
    let ext = (uploadedFile.name as NSString).pathExtension
    if !["png","jpg"].contains(ext) { return }
    // ok: swift-434-upload
    FileManager.default.createFile(atPath: "/uploads/allowed.png", contents: uploadedFile.data)
}

func safeFixed() {
    // ok: swift-434-upload
    FileManager.default.createFile(atPath: "/tmp/fixed.png", contents: Data())
}
