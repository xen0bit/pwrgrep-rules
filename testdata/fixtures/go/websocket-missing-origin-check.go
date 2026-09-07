package fixture

import (
	"github.com/gorilla/websocket"
	"net/http"
)

func vulnBare() {
	// ruleid: websocket-missing-origin-check
	upgrader := websocket.Upgrader{}
	_ = upgrader
}

func vulnBuffersOnly() {
	// ruleid: websocket-missing-origin-check
	upgrader := websocket.Upgrader{ReadBufferSize: 1024, WriteBufferSize: 1024}
	_ = upgrader
}

var vulnAssigned = func() websocket.Upgrader {
	// ruleid: websocket-missing-origin-check
	upgrader := websocket.Upgrader{}
	return upgrader
}()

func safeWithCheck() {
	// ok: websocket-missing-origin-check
	upgrader := websocket.Upgrader{
		CheckOrigin: func(r *http.Request) bool { return true },
	}
	_ = upgrader
}

func safeWithCheckAndBuffers() {
	// ok: websocket-missing-origin-check
	upgrader := websocket.Upgrader{
		ReadBufferSize: 1024,
		CheckOrigin:    func(r *http.Request) bool { return r.URL.Host == "example.com" },
	}
	_ = upgrader
}

func safeNoUpgrader() string {
	// ok: websocket-missing-origin-check
	return "no upgrader built here"
}
