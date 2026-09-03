package fixture

// CWE-362: the counter is raised inside the goroutine it is counting.
//
// wg.Add(1) written inside the goroutine races the wg.Wait() that is supposed
// to be waiting for it. The scheduler is under no obligation to start the
// goroutine before the calling function reaches Wait, so Wait can see a
// counter of zero, return immediately, and let the program carry on while the
// work it was waiting for has not started. It passes every test on a busy
// machine and fails on an idle one.
//
// Add belongs before the `go`, where it is ordered with respect to Wait by
// being on the same goroutine.

import (
	"sync"
	"sync/atomic"
)

func waitsForNothing(items []string) {
	var wg sync.WaitGroup
	for _, item := range items {
		go func(s string) {
			// ruleid: go-waitgroup-add-inside-goroutine
			wg.Add(1)
			defer wg.Done()
			_ = s
		}(item)
	}
	wg.Wait()
}

func waitsForNothingOnAPointer(group *sync.WaitGroup, work func()) {
	go func() {
		// ruleid: go-waitgroup-add-inside-goroutine
		group.Add(1)
		defer group.Done()
		work()
	}()
}

// Counted before the goroutine starts, which is what orders it against Wait.
func waitsProperly(items []string) {
	var wg sync.WaitGroup
	for _, item := range items {
		// ok: go-waitgroup-add-inside-goroutine
		wg.Add(1)
		go func(s string) {
			defer wg.Done()
			_ = s
		}(item)
	}
	wg.Wait()
}

// An atomic counter's Add is the correct thing to do inside a goroutine, and
// it is spelled the same way.
func countsInsideTheGoroutine(done *atomic.Int64, work func()) {
	go func() {
		work()
		// ok: go-waitgroup-add-inside-goroutine
		done.Add(1)
	}()
}
