package fixture

// CWE-770: the whole request body is read into memory, however big it is.
//
// io.ReadAll grows a buffer until the reader stops, and a request body stops
// when the client decides to stop sending. A handler that reads one is
// offering to allocate whatever the client feels like sending, and a few
// concurrent requests of a few gigabytes each is the whole process. The fix
// is one line - http.MaxBytesReader, which also tells the client why it was
// cut off - and it is the line that is missing.

import (
	"io"
	"net/http"
)

func readsWhateverArrives(w http.ResponseWriter, r *http.Request) {
	// ruleid: go-unbounded-request-body-read
	body, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "bad body", http.StatusBadRequest)
		return
	}
	w.Write(body)
}

func readsIntoAString(r *http.Request) (string, error) {
	// ruleid: go-unbounded-request-body-read
	b, err := io.ReadAll(r.Body)
	return string(b), err
}

// Capped before it is read, and the cap is what makes the read bounded.
func readsUpToALimit(w http.ResponseWriter, r *http.Request) {
	r.Body = http.MaxBytesReader(w, r.Body, 1<<20)
	// ok: go-unbounded-request-body-read
	body, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "too big", http.StatusRequestEntityTooLarge)
		return
	}
	w.Write(body)
}

// Reading a response the program asked for is not reading a body a stranger
// chose the size of.
func readsAResponse(resp *http.Response) ([]byte, error) {
	// ok: go-unbounded-request-body-read
	return io.ReadAll(resp.Body)
}
