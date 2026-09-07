package fixture

import _ "net/http/pprof"

func vulnDefault() {
	// ruleid: pprof-debug-exposure
	_ = http.ListenAndServe(":8080", nil)
}

func vulnDefaultAgain(addr string) {
	// ruleid: pprof-debug-exposure
	_ = http.ListenAndServe(addr, nil)
}

func vulnDefaultThird(mux *http.ServeMux) {
	// ruleid: pprof-debug-exposure
	_ = http.ListenAndServe(":9090", mux)
}

func safeNoListen() string {
	// ok: pprof-debug-exposure
	return "no server started here"
}

func safeNoPprofImport() string {
	// ok: pprof-debug-exposure
	return "this file has the import so this line is only an ok because it is not a ListenAndServe call"
}

func safeHelper() int {
	// ok: pprof-debug-exposure
	return 1 + 1
}
