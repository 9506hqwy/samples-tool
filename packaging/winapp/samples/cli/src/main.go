package main

import (
	"fmt"
	"log"

	"golang.org/x/sys/windows/registry"
)

func main() {
	const keyName = `SOFTWARE\\9506hqwy`

	key, _, err := registry.CreateKey(registry.LOCAL_MACHINE, keyName, registry.SET_VALUE)
	if err != nil {
		log.Fatalf("Failed to create registry key: %v", err)
	}
	defer key.Close()

	err = key.SetStringValue("key1", "value1")
	if err != nil {
		log.Fatalf("Failed to write registry value: %v", err)
	}

	fmt.Println("Success")
}
