package fixture

import "net/url"

func vulnRawQuery(u *url.URL) {
	// ruleid: shared-url-struct-mutation
	u.RawQuery = "x=1"
}

func vulnPath(u *url.URL) {
	// ruleid: shared-url-struct-mutation
	u.Path = "/other"
}

func vulnHost(u *url.URL) {
	// ruleid: shared-url-struct-mutation
	u.Host = "example.com"
}

func safeParseOnly(raw string) (*url.URL, error) {
	// ok: shared-url-struct-mutation
	return url.Parse(raw)
}

func safeRead(u *url.URL) string {
	// ok: shared-url-struct-mutation
	return u.Query().Get("x")
}

func safeLiteral() url.URL {
	// ok: shared-url-struct-mutation
	return url.URL{Scheme: "https", Host: "example.com"}
}
