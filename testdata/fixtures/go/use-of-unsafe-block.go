package fixture

import (
	"unsafe"
)

func vulnPointer(x *int) unsafe.Pointer {
	// ruleid: use-of-unsafe-block
	return unsafe.Pointer(x)
}

func vulnSizeof(x int) uintptr {
	// ruleid: use-of-unsafe-block
	return unsafe.Sizeof(x)
}

func vulnOffsetof(x struct{ f int }) uintptr {
	// ruleid: use-of-unsafe-block
	return unsafe.Offsetof(x.f)
}

func safeConvert(p unsafe.Pointer) *int {
	// ok: use-of-unsafe-block
	return (*int)(p)
}

func safePlain(x *int) *int {
	// ok: use-of-unsafe-block
	return x
}

func safeMention() string {
	// ok: use-of-unsafe-block
	return "unsafe.Pointer in a comment is not a call"
}
