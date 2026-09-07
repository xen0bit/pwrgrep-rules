package fixture

func vulnSameCond(a, b bool) int {
	// ruleid: useless-if-conditional
	if a {
		return 1
	} else if a {
		return 2
	}
	return 0
}

func vulnSameCondCall(x int) int {
	// ruleid: useless-if-conditional
	if x > 0 {
		return x
	} else if x > 0 {
		return -x
	}
	return 0
}

func vulnSameCondFlag(enabled bool, verbose bool) string {
	// ruleid: useless-if-conditional
	if enabled {
		return "on"
	} else if enabled {
		if verbose {
			return "loud"
		}
		return "quiet"
	}
	return "off"
}

func safeDiffCond(a, b bool) int {
	// ok: useless-if-conditional
	if a {
		return 1
	} else if b {
		return 2
	}
	return 0
}

func safePlainElse(a bool) int {
	// ok: useless-if-conditional
	if a {
		return 1
	}
	return 0
}

func safeDiffBodies(a bool) int {
	// ok: useless-if-conditional
	if a {
		return 1
	} else {
		return 2
	}
	return 0
}
