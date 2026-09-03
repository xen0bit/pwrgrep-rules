package fixture

// CWE-772: an HTTP response body is never closed.
//
// net/http hands back a response whose Body is an open connection. Until it
// is closed the connection cannot go back to the pool, so a handler that
// forgets holds one file descriptor and one socket per request it makes;
// under load the process runs out of both. The compiler says nothing, and the
// code works perfectly until it is busy.

import (
	"errors"
	"io"
	"net/http"
)

func leaksConnection(url string) error {
	// ruleid: go-response-body-not-closed
	resp, err := http.Get(url)
	if err != nil {
		return err
	}
	_, err = io.Copy(io.Discard, resp.Body)
	return err
}

func leaksOnPost(url string, body io.Reader) error {
	// ruleid: go-response-body-not-closed
	resp, err := http.Post(url, "application/json", body)
	if err != nil {
		return err
	}
	_ = resp.StatusCode
	return nil
}

func leaksOnClientDo(c *http.Client, req *http.Request) error {
	// ruleid: go-response-body-not-closed
	resp, err := c.Do(req)
	if err != nil {
		return err
	}
	_ = resp.StatusCode
	return nil
}

// The ordinary correct spelling: closed on the way out, after the error was
// checked, because on an error there is no body to close.
func closesTheBody(url string) error {
	// ok: go-response-body-not-closed
	resp, err := http.Get(url)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	_, err = io.Copy(io.Discard, resp.Body)
	return err
}

// Closed rather than deferred, which is still closed.
func closesWithoutDefer(c *http.Client, req *http.Request) error {
	// ok: go-response-body-not-closed
	resp, err := c.Do(req)
	if err != nil {
		return err
	}
	_ = resp.StatusCode
	resp.Body.Close()
	return nil
}

// Handed to the caller, who closes it. Every helper that hands back an
// io.ReadCloser is written this way and none of them has leaked anything.
func returnsTheBody(url string) (io.ReadCloser, error) {
	// ok: go-response-body-not-closed
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	return resp.Body, nil
}

// Closed on each path out rather than beside the request. This is the shape
// that decided the rule asks its question of the whole function: matched as a
// sibling of the request, the close one line further in is not seen at all.
func closesInEachBranch(c *http.Client, req *http.Request) error {
	// ok: go-response-body-not-closed
	resp, err := c.Do(req)
	if err != nil {
		return err
	}
	if resp.StatusCode != http.StatusOK {
		resp.Body.Close()
		return errors.New("bad status")
	}
	resp.Body.Close()
	return nil
}
