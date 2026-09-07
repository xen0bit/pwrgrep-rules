package fixture

import "reflect"

func vulnMethod(v reflect.Value, name string) reflect.Value {
	// ruleid: unsafe-reflect-by-name
	return v.MethodByName(name)
}

func vulnMethodAgain(v reflect.Value, name string) reflect.Value {
	// ruleid: unsafe-reflect-by-name
	m := v.MethodByName(name)
	return m
}

func vulnField(v reflect.Value, name string) reflect.Value {
	// ruleid: unsafe-reflect-by-name
	return v.FieldByName(name)
}

func safeMethodStatic(v reflect.Value) reflect.Value {
	// ok: unsafe-reflect-by-name
	return v.MethodByName("Static")
}

func safeFieldStatic(v reflect.Value) reflect.Value {
	// ok: unsafe-reflect-by-name
	return v.FieldByName("Static")
}

func safeNum(v reflect.Value, i int) reflect.Value {
	// ok: unsafe-reflect-by-name
	return v.Field(i)
}
