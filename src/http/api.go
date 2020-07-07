package http

import (
	"strings"
	"net/http"
	"strconv"
	"fmt"
)

func configApiRoutes() {

	
	
	http.HandleFunc("/api/garbage", func(w http.ResponseWriter, r *http.Request) {
		r.ParseForm()
		if len(r.Form["ckSize"]) == 0 {
			o := "Missing Param !"
			http.Error(w, o, 406)
			return
		}

		// Download follows...
		w.Header().Set("Content-Description","File Transfer")
		w.Header().Set("Content-Type","application/octet-stream")
		w.Header().Set("Content-Disposition","attachment; filename=random.dat")
		w.Header().Set("Content-Transfer-Encoding","binary")
		// Never cache me
		w.Header().Set("Cache-Control","no-store, no-cache, must-revalidate, max-age=0")
		w.Header().Set("Cache-Control","post-check=0, pre-check=0")
		w.Header().Set("Pragma","no-cache")
		data := make([]byte, 1048577)
		ckSize,_  :=strconv.Atoi(r.Form["ckSize"][0])
		f, _ := w.(http.Flusher)
		for i := 0;i <=ckSize; i++ {
			w.Write(data)
			f.Flush()
		}
	
	})


	http.HandleFunc("/api/empty", func(w http.ResponseWriter, r *http.Request) {
		r.Body = http.MaxBytesReader(w, r.Body, 32<<20+1024)
		w.Header().Set("Cache-Control","no-store, no-cache, must-revalidate, max-age=0")
		w.Header().Set("Cache-Control","post-check=0, pre-check=0")
		w.Header().Set("Pragma","no-cache")
	})


	http.HandleFunc("/api/getip", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, strings.Split(r.RemoteAddr, ":")[0])
	})

}
