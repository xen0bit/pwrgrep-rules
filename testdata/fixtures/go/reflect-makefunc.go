package fixture

import (
	"reflect"
)

func vulnMake(t reflect.Type, fn interface{}) reflect.Value {
	// ruleid: reflect-makefunc
	return reflect.MakeFunc(t, fn)
}

func vulnMakeAgain(t reflect.Type) reflect.Value {
	// ruleid: reflect-makefunc
	return reflect.MakeFunc(t, nil)
}

func vulnMakeThird(t reflect.Type, impl func(args []reflect.Value) []reflect.Value) reflect.Value {
	// ruleid: reflect-makefunc
	return reflect.MakeFunc(t, impl)
}

func safeTypeOf(v interface{}) reflect.Type {
	// ok: reflect-makefunc
	return reflect.TypeOf(v)
}

func safeValueOf(v interface{}) reflect.Value {
	// ok: reflect-makefunc
	return reflect.ValueOf(v)
}

func safeMention() string {
	// ok: reflect-makefunc
	return "MakeFunc in a comment is not a call"
}
