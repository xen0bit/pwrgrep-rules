package fixture

func vulnAppend(items []int) []*int {
	var out []*int
	// ruleid: exported_loop_pointer
	for _, v := range items {
		out = append(out, &v)
	}
	return out
}

func vulnParen(items []int) []*int {
	var out []*int
	// ruleid: exported_loop_pointer
	for _, v := range items {
		p := &(v)
		out = append(out, p)
	}
	return out
}

func vulnClosure(items []int) []func() *int {
	var out []func() *int
	// ruleid: exported_loop_pointer
	for _, v := range items {
		out = append(out, func() *int { return &v })
	}
	return out
}

func safeValue(items []int) []int {
	var out []int
	// ok: exported_loop_pointer
	for _, v := range items {
		out = append(out, v)
	}
	return out
}

func safeAddrOutside(items []int, w int) []*int {
	pw := &w
	var out []*int
	// ok: exported_loop_pointer
	for _, v := range items {
		out = append(out, pw)
		_ = v
	}
	return out
}

func safeIndex(items []int) []int {
	var out []int
	// ok: exported_loop_pointer
	for i := range items {
		out = append(out, items[i])
	}
	return out
}
