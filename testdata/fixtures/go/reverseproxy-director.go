package fixture

import "net/http/httputil"
import "net/http"

func vulnAssign(p *httputil.ReverseProxy) {
	// ruleid: reverseproxy-director
	p.Director = rewriteTarget
}

func vulnAssignAgain(p *httputil.ReverseProxy) {
	// ruleid: reverseproxy-director
	p.Director = rewriteTarget
}

func vulnAssignThird(p *httputil.ReverseProxy) {
	// ruleid: reverseproxy-director
	p.Director = rewriteTarget
}

func safeNoDirector(p *httputil.ReverseProxy) *httputil.ReverseProxy {
	// ok: reverseproxy-director
	return p
}

func safeMention() string {
	// ok: reverseproxy-director
	return "Director in a comment is not an assignment"
}

func rewriteTarget(r *http.Request) {
	// ok: reverseproxy-director
	_ = r
}
