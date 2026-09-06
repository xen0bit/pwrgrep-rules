// CWE-434: HttpPostedFileBase without extension allowlist
using System.IO;
using System.Web;

public class TestCWE434 : System.Web.Mvc.Controller {
    public void vuln1(HttpPostedFileBase file) {
        string name = file.FileName;
        // ruleid: csharp-434-upload
        File.SaveAs("/uploads/" + name);
    }
    public void vuln2() {
        HttpPostedFileBase f = Request.Files[0];
        string p = f.FileName;
        // ruleid: csharp-434-upload
        File.WriteAllBytes("/tmp/" + p, new byte[0]);
    }
    public void vuln3(HttpPostedFileBase uploaded) {
        var path = uploaded.FileName;
        // ruleid: csharp-434-upload
        File.Create("/uploads/" + path);
    }
    public void safeAllowlist(HttpPostedFileBase file) {
        string ext = Path.GetExtension(file.FileName);
        if (ext != ".png" && ext != ".jpg") return;
        string allowlist = "/uploads/allowed.png";
        // ok: csharp-434-upload
        File.SaveAs(allowlist);
    }
    public void safeFixed() {
        // ok: csharp-434-upload
        File.WriteAllBytes("/tmp/fixed.png", new byte[0]);
    }
}
