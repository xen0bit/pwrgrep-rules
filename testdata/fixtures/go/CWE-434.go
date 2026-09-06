// CWE-434: Unrestricted upload — FormFile filename reaches file write.
package main

import (
    "io"
    "io/ioutil"
    "net/http"
    "os"
)

func vuln1(w http.ResponseWriter, r *http.Request) {
    file, header, _ := r.FormFile("file")
    defer file.Close()
    // ruleid: go-unrestricted-upload
    ioutil.WriteFile("/tmp/"+header.Filename, header.Filename, 0644)
    // ruleid: go-unrestricted-upload
    os.Create("/tmp/" + header.Filename)
}

func vuln2(w http.ResponseWriter, r *http.Request) {
    _, hdr, _ := r.FormFile("upload")
    name := hdr.Filename
    // ruleid: go-unrestricted-upload
    os.WriteFile("/uploads/"+name, []byte("x"), 0644)
}

func safeFixed(w http.ResponseWriter, r *http.Request) {
    // ok: go-unrestricted-upload
    os.Create("/tmp/fixed.txt")
    // ok: go-unrestricted-upload
    ioutil.WriteFile("/tmp/fixed.txt", []byte("fixed"), 0644)
}

func safeWhitelist(w http.ResponseWriter, r *http.Request) {
    _, hdr, _ := r.FormFile("file")
    name := hdr.Filename
    if name != "allowed.png" {
        http.Error(w, "bad", 400)
        return
    }
    // ok: go-unrestricted-upload
    os.WriteFile("/tmp/allowed.png", []byte("x"), 0644)
}

// helper to avoid unused import
var _ = io.Copy
