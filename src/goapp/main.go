package main

import (
	"fmt"
	"os"
	"net/http"
)
func handler(w http.ResponseWriter, r *http.Request){
	name, err := os.Hostname()
	if err != nil {
		panic(err)
	}

	fmt.Println("hostname:", name)
}
func main() {

	http.HandleFunc("/",handler)
	log.Fatal(http.ListenAndServe(":8888:",nil))
	
}