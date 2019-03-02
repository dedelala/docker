#!/bin/sh

src="$(mktemp).go"
trap 'rm -rf "$src"' EXIT

cat > "$src" <<go
package main

import "fmt"

func main() {
	fmt.Println("°˖✧◝(⁰▿⁰)◜✧˖°")
}
go

go run "$src" || { echo "(╥_╥)"; exit 1; }
