package http

import (
	"github.com/zyanqiang/speedtest/src/g"
	"github.com/cihub/seelog"
	"net/http"
	"path/filepath"
	"strings"
)

func configIndexRoutes() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if strings.HasSuffix(r.URL.Path, "/") {
			if !g.IsExist(filepath.Join(g.Root, "/html", r.URL.Path, "index.html")) {
				http.NotFound(w, r)
				return
			}
			seelog.Info(r.RemoteAddr," access the server")	
		}
		http.FileServer(http.Dir(filepath.Join(g.Root, "/html"))).ServeHTTP(w, r)

	})

}
