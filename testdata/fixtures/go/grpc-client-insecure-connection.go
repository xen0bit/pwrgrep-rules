package fixture

import (
	"google.golang.org/grpc"
)

func vulnDial(addr string) (*grpc.ClientConn, error) {
	// ruleid: grpc-client-insecure-connection
	conn, err := grpc.Dial(addr, grpc.WithInsecure())
	return conn, err
}

func vulnDialWithExtra(addr string) (*grpc.ClientConn, error) {
	// ruleid: grpc-client-insecure-connection
	conn, err := grpc.Dial(addr, grpc.WithBlock(), grpc.WithInsecure())
	return conn, err
}

func vulnDialTrailing(addr string) (*grpc.ClientConn, error) {
	// ruleid: grpc-client-insecure-connection
	conn, err := grpc.Dial(addr, grpc.WithInsecure(), grpc.WithBlock())
	return conn, err
}

func safeTLS(addr string) (*grpc.ClientConn, error) {
	// ok: grpc-client-insecure-connection
	conn, err := grpc.Dial(addr, grpc.WithTransportCredentials(creds))
	return conn, err
}

func safeBlockOnly(addr string) (*grpc.ClientConn, error) {
	// ok: grpc-client-insecure-connection
	conn, err := grpc.Dial(addr, grpc.WithBlock())
	return conn, err
}

func safeNoDial(addr string) string {
	// ok: grpc-client-insecure-connection
	return "grpc.WithInsecure() in a comment is not a call"
}
