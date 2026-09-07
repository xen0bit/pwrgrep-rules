package fixture

import "net/http/cgi"

func vulnServe(req *http.Request) {
	// ruleid: insecure-module-used
	_ = cgi.Serve(req)
}

func vulnServeAgain(req *http.Request, w http.ResponseWriter) {
	// ruleid: insecure-module-used
	_ = cgi.Serve(req)
	_ = w
}

func vulnServeThird(req *http.Request) error {
	// ruleid: insecure-module-used
	return cgi.Serve(req)
}

func safeStdlib(w http.ResponseWriter, req *http.Request) {
	// ok: insecure-module-used
	w.WriteHeader(http.StatusOK)
	_, _ = w.Write([]byte("ok"))
	_ = req
}

func safeMention() string {
	// ok: insecure-module-used
	return "cgi.Serve in a comment is not a call"
}

func safeNoCgi() string {
	// ok: insecure-module-used
	return "nothing to do with cgi here"
}
