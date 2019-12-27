package main
import (
   "fmt"
   "net/http"
)
func handlerHello(w http.ResponseWriter, r *http.Request) {
   fmt.Fprintf(w, "master hello Go 20191227")
}
func main() {
   http.HandleFunc("/", handlerHello)
   http.ListenAndServe(":8080", nil)
}
