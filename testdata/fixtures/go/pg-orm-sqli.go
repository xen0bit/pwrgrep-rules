package main

import (
	"fmt"

	"github.com/go-pg/pg/v10"
)

type User struct {
	Name string
}

func getUsers(db *pg.DB, name string) {
	var users []User
	// ruleid: pg-orm-sqli
	db.Model(&users).Where("name = '" + name + "'").Select()
}

func getUsersFmt(db *pg.DB, name string) {
	var users []User
	// ruleid: pg-orm-sqli
	db.Model(&users).Where(fmt.Sprintf("name = '%s'", name)).Select()
}

func getOk(db *pg.DB, name string) {
	var users []User
	// ok: pg-orm-sqli
	db.Model(&users).Where("name = ?", name).Select()
}

func getOkConst(db *pg.DB) {
	var users []User
	// ok: pg-orm-sqli
	db.Model(&users).Where("active = true").Select()
}
