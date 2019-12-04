package main
import (
   "fmt"
   "net/http"
)
func handlerHello(w http.ResponseWriter, r *http.Request) {
   fmt.Fprintf(w, "master hello Go")
}
func main() {
   http.HandleFunc("/", handlerHello)
   http.ListenAndServe(":8080", nil)
}
