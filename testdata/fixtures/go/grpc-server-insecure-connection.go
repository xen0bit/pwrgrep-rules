package fixture

import (
	"google.golang.org/grpc"
)

func vulnBare() *grpc.Server {
	// ruleid: grpc-server-insecure-connection
	s := grpc.NewServer()
	return s
}

func vulnBareAgain() *grpc.Server {
	// ruleid: grpc-server-insecure-connection
	s := grpc.NewServer()
	return s
}

func vulnBareThird() *grpc.Server {
	// ruleid: grpc-server-insecure-connection
	s := grpc.NewServer()
	return s
}

func safeWithCreds() *grpc.Server {
	// ok: grpc-server-insecure-connection
	s := grpc.NewServer(grpc.Creds(creds))
	return s
}

func safeWithCredsAndOpts() *grpc.Server {
	// ok: grpc-server-insecure-connection
	s := grpc.NewServer(grpc.Creds(creds), grpc.MaxRecvMsgSize(1024))
	return s
}

func safeCredsMention() string {
	// ok: grpc-server-insecure-connection
	return "grpc.NewServer in a comment is not a server"
}
