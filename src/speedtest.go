package main

import (
	"flag"
	"fmt"
	"github.com/zyanqiang/speedtest/src/g"
	"github.com/zyanqiang/speedtest/src/http"
	"os"
	"runtime"
	//"sync"
)

// Init config
var Version = "0.1.0"

func main() {
	runtime.GOMAXPROCS(runtime.NumCPU())
	version := flag.Bool("v", false, "show version")
	flag.Parse()
	if *version {
		fmt.Println(Version)
		os.Exit(0)
	}
	g.ParseConfig(Version)
	http.StartHttp()
}
