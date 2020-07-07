package http

import (

	"fmt"
	"github.com/cihub/seelog"
	"github.com/zyanqiang/speedtest/src/g"
	"log"
	"net/http"
	"os"

)



func StartHttp() {
	configApiRoutes()
	configIndexRoutes()
	seelog.Info("[func:StartHttp] starting to listen on ", g.Cfg.Addr,":",g.Cfg.Port)
	s := fmt.Sprintf("%s:%d",g.Cfg.Addr,g.Cfg.Port)
	err := http.ListenAndServe(s, nil)
	if err != nil {
		log.Fatalln("[StartHttp]", err)
	}
	os.Exit(0)
}
