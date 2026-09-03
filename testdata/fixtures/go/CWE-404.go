package fixture

// CWE-404: a defer inside a loop does not run at the end of the iteration.
//
// defer is scoped to the function, not to the block it is written in, so a
// defer in a loop body queues one more call for the end of the function and
// releases nothing in the meantime. A loop over a directory listing holds
// every file open until it finishes, and a loop that takes a lock deadlocks
// on its second turn. It reads exactly like the correct code, which is why it
// survives review.

import (
	"os"
	"sync"
)

func leakEveryFile(names []string) error {
	for _, name := range names {
		f, err := os.Open(name)
		if err != nil {
			return err
		}
		// ruleid: go-defer-inside-loop
		defer f.Close()
		_ = f
	}
	return nil
}

func deadlockOnSecondTurn(mu *sync.Mutex, work []int) {
	for range work {
		mu.Lock()
		// ruleid: go-defer-inside-loop
		defer mu.Unlock()
	}
}

func leakInACountingLoop(names []string) {
	for i := 0; i < len(names); i++ {
		f, err := os.Open(names[i])
		if err != nil {
			continue
		}
		// ruleid: go-defer-inside-loop
		defer f.Close()
	}
}

// Closed at the end of the iteration, which is where the file stops being
// needed. A defer here would be the bug.
func closesEachFile(names []string) error {
	for _, name := range names {
		f, err := os.Open(name)
		if err != nil {
			return err
		}
		// ok: go-defer-inside-loop
		f.Close()
	}
	return nil
}

// One defer, once, for the whole function.
func closesOnce(name string, names []string) error {
	f, err := os.Open(name)
	if err != nil {
		return err
	}
	// ok: go-defer-inside-loop
	defer f.Close()
	for range names {
		_ = f
	}
	return nil
}

// The defer is in a function of its own, so it runs when that function
// returns - at the end of the iteration, which is the whole point. This is
// the correct spelling and it sits inside a loop, so a rule that only asks
// "is there a defer in this loop body" reports it.
func closesPerIteration(wg *sync.WaitGroup, names []string) {
	for _, name := range names {
		go func(n string) {
			// ok: go-defer-inside-loop
			defer wg.Done()
			_ = n
		}(name)
	}
}

// The loop is inside the deferred function rather than the other way round.
func deferredLoop(names []string) {
	// ok: go-defer-inside-loop
	defer func() {
		for range names {
		}
	}()
}
