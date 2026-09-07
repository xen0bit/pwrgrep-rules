package fixture

import "sync"

func vulnSend(mu *sync.Mutex, ch chan int, v int) {
	// ruleid: channel-guarded-with-mutex
	mu.Lock()
	ch <- v
	mu.Unlock()
}

func vulnSendAgain(mu *sync.Mutex, ch chan string, v string) {
	// ruleid: channel-guarded-with-mutex
	mu.Lock()
	ch <- v
	mu.Unlock()
}

func vulnRecv(mu *sync.Mutex, ch chan int) int {
	var x int
	// ruleid: channel-guarded-with-mutex
	mu.Lock()
	x = <-ch
	mu.Unlock()
	return x
}

func safeSendNoMutex(ch chan int, v int) {
	// ok: channel-guarded-with-mutex
	ch <- v
}

func safeRecvNoMutex(ch chan int) int {
	// ok: channel-guarded-with-mutex
	return <-ch
}

func safeUnlockBetween(mu *sync.Mutex, ch chan int, v int) {
	mu.Lock()
	mu.Unlock()
	// ok: channel-guarded-with-mutex
	ch <- v
}
