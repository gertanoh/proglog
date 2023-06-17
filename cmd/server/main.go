package main

import (
	"fmt"
	"log"

	"github.com/henrtytanoh/proglog/internal/server"
)

func main() {
	srv := server.NewHTTPServer(":8080")
	fmt.Println("Staring application on Ip localhost and port 8080")
	log.Fatal(srv.ListenAndServe())
}
