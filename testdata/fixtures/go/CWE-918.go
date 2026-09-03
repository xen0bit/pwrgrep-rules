package fixture

// CWE-918: the request decides which host the server talks to.
//
// A URL that arrives in a parameter can name anything the server can reach,
// and a server can usually reach more than its clients can: 127.0.0.1,
// 10.0.0.0/8, and on a cloud instance the metadata service at 169.254.169.254
// that will hand out credentials to anyone who asks from the right place.
// Fetching it makes the server a proxy into its own network.
//
// The sources here are the request and nothing else. A URL from a
// configuration file or an environment variable is chosen by whoever runs the
// program, which is a different question from one chosen by whoever sent the
// request, and reporting it would bury the case that matters.
//
// No sanitizer is named, because none of them is syntax. Checking a URL is
// safe means resolving it and deciding what the address is - and a rule that
// cannot see a resolver should not pretend an allowlist it cannot read is one.

import (
	"net/http"
	"os"
)

func fetchesWhateverItIsAsked(w http.ResponseWriter, r *http.Request) {
	target := r.URL.Query().Get("url")
	// ruleid: go-request-decides-the-host
	resp, err := http.Get(target)
	if err != nil {
		http.Error(w, "upstream", http.StatusBadGateway)
		return
	}
	defer resp.Body.Close()
}

func postsToAnyHost(r *http.Request) error {
	hook := r.FormValue("callback")
	// ruleid: go-request-decides-the-host
	req, err := http.NewRequest("POST", hook, nil)
	if err != nil {
		return err
	}
	_ = req
	return nil
}

func proxiesAPath(client *http.Client, r *http.Request) error {
	path := r.URL.Query().Get("path")
	// ruleid: go-request-decides-the-host
	resp, err := client.Get("http://internal.svc/" + path)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	return nil
}

// Chosen by whoever runs the program, not by whoever sent the request.
func fetchesItsConfiguredUpstream() error {
	// ok: go-request-decides-the-host
	resp, err := http.Get(os.Getenv("UPSTREAM_URL"))
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	return nil
}

// Nothing from the request decides this.
func fetchesAFixedEndpoint() error {
	// ok: go-request-decides-the-host
	resp, err := http.Get("https://api.example.com/v1/status")
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	return nil
}
