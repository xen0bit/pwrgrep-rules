package fixture

// CWE-459: the cancel function of a derived context is never called.
//
// context.WithCancel, WithTimeout and WithDeadline each return a cancel
// function, and the context they return stays attached to its parent until
// that function runs. Dropping it leaks the child - and everything watching
// it - for as long as the parent lives, which for a server's background
// context is the life of the process. A timeout does not save it: WithTimeout
// releases its own timer when it fires, but the parent keeps the child until
// cancel is called.

import (
	"context"
	"time"
)

func discardsCancel(parent context.Context) context.Context {
	// ruleid: go-context-cancel-not-called
	ctx, _ := context.WithCancel(parent)
	return ctx
}

func discardsTimeoutCancel(parent context.Context) context.Context {
	// ruleid: go-context-cancel-not-called
	ctx, _ := context.WithTimeout(parent, time.Second)
	return ctx
}

func neverCallsCancel(parent context.Context) error {
	// ruleid: go-context-cancel-not-called
	ctx, cancel := context.WithTimeout(parent, time.Second)
	_ = cancel
	return doWork(ctx)
}

// The ordinary correct spelling.
func deferredCancel(parent context.Context) error {
	// ok: go-context-cancel-not-called
	ctx, cancel := context.WithTimeout(parent, time.Second)
	defer cancel()
	return doWork(ctx)
}

// Called rather than deferred, which is still called.
func callsCancel(parent context.Context) error {
	// ok: go-context-cancel-not-called
	ctx, cancel := context.WithCancel(parent)
	err := doWork(ctx)
	cancel()
	return err
}

// A deadline set on a context that is cancelled on the way out.
func deferredDeadline(parent context.Context, at time.Time) error {
	// ok: go-context-cancel-not-called
	ctx, cancel := context.WithDeadline(parent, at)
	defer cancel()
	return doWork(ctx)
}

func doWork(ctx context.Context) error { _ = ctx; return nil }
