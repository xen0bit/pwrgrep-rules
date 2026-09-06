package fixture

import (
	"net/http"
)

func fetchesWhateverItIsAsked(w http.ResponseWriter, r *http.Request) {
	target := r.URL.Query().Get("url")
	// ruleid: go-ssrf
	resp, _ := http.Get(target)
	_ = resp
}

func postsToAnyHost(r *http.Request) error {
	hook := r.FormValue("callback")
	// ruleid: go-ssrf
	req, _ := http.NewRequest("POST", hook, nil)
	_ = req
	return nil
}

func clientGet(r *http.Request, client *http.Client) error {
	url := r.Header.Get("X-URL")
	// ruleid: go-ssrf
	resp, _ := client.Get(url)
	_ = resp
	return nil
}

func doAnyHost(r *http.Request, client *http.Client) error {
	target := r.URL.Query().Get("target")
	// ruleid: go-ssrf
	req, _ := http.NewRequest("GET", target, nil)
	_ = req
	return nil
}

// ok: go-ssrf
func fetchesFixedEndpoint() error {
	resp, _ := http.Get("https://api.example.com/v1/status")
	_ = resp
	return nil
}

// ok: go-ssrf
func fetchesConfigured(url string) error {
	resp, _ := http.Get(url)
	_ = resp
	return nil
}
