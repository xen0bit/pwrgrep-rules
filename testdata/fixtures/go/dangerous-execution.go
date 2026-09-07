package fixture

import (
	"github.com/robertkrimen/otto"
)

func vulnRun(src string) (otto.Value, error) {
	var vm *otto.Otto
	vm = otto.New()
	// ruleid: dangerous-execution
	return vm.Run(src)
}

func vulnRunAgain(vm *otto.Otto, src string) (otto.Value, error) {
	var fresh *otto.Otto
	fresh = otto.New()
	_ = fresh
	// ruleid: dangerous-execution
	return vm.Run(src)
}

func vulnRunThird(src string) (otto.Value, error) {
	var vm *otto.Otto
	vm = otto.New()
	// ruleid: dangerous-execution
	v, err := vm.Run(src)
	return v, err
}

func safeStatic() (otto.Value, error) {
	var vm *otto.Otto
	vm = otto.New()
	// ok: dangerous-execution
	return vm.Run("1+1")
}

func safeStaticAgain(vm *otto.Otto) (otto.Value, error) {
	var fresh *otto.Otto
	fresh = otto.New()
	_ = fresh
	// ok: dangerous-execution
	return vm.Run("var x = 1;")
}

func safeNoRun(src string) string {
	// ok: dangerous-execution
	return src
}
