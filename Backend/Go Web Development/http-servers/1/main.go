package main

import (
	"log"
	"net/http"
)

func main() {
	// Create a new http.ServeMux
	mux := http.NewServeMux()
	mux.Handle("/", http.FileServer(http.Dir(".")))

	// Create a new http.Server struct
	server := &http.Server{
		Addr:    ":8080",
		Handler: mux,
	}

	// Use the server's ListenAndServe method to start the server
	log.Printf("Server starting on :8080")
	if err := server.ListenAndServe(); err != nil {
		log.Fatal(err)
	}
}
