package fixture

// ruleid: hidden-goroutine
func vulnOnly(done chan bool) {
	go func() {
		done <- true
	}()
}

// ruleid: hidden-goroutine
func vulnOnlyArg(done chan bool, v int) {
	go func() {
		done <- true
		_ = v
	}()
}

// ruleid: hidden-goroutine
func vulnOnlyThird() {
	go func() {
		println("background")
	}()
}

// ok: hidden-goroutine
func safeWithMore(done chan bool) {
	go func() {
		done <- true
	}()
	println("also does work")
}

// ok: hidden-goroutine
func safeNoGo(v int) int {
	return v + 1
}

// ok: hidden-goroutine
func safeGoAssigned(done chan bool) func() {
	f := func() {
		done <- true
	}
	return f
}
