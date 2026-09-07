package fixture

import "net/http/httptrace"

func vulnParam(ctx context.Context, t *httptrace.ClientTrace) context.Context {
	// ruleid: dynamic-httptrace-clienttrace
	return httptrace.WithClientTrace(ctx, t)
}

func vulnParamAgain(ctx context.Context, t *httptrace.ClientTrace) context.Context {
	// ruleid: dynamic-httptrace-clienttrace
	return httptrace.WithClientTrace(ctx, t)
}

func vulnParamThird(ctx context.Context, t *httptrace.ClientTrace) context.Context {
	// ruleid: dynamic-httptrace-clienttrace
	return httptrace.WithClientTrace(ctx, t)
}

func safePlain(ctx context.Context) context.Context {
	// ok: dynamic-httptrace-clienttrace
	return context.WithValue(ctx, "k", "v")
}

func safeNoTrace(ctx context.Context) context.Context {
	// ok: dynamic-httptrace-clienttrace
	return ctx
}

func safeMention() string {
	// ok: dynamic-httptrace-clienttrace
	return "WithClientTrace in a comment is not a call"
}
