package main

import (
	"encoding/json"
	"fmt"
	"github.com/gookit/color"
	"io/ioutil"
	"net/http"
	"os"
)

func main() {
	url := "https://fyalygjopz3r5yqczyxnmoxucv7ju5c6.mapper.ntppool.org/json"
	client := &http.Client{}
	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Add("Accept", "application/json")
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("No Internet")
		os.Exit(0)
	}
	defer resp.Body.Close()
	body, _ := ioutil.ReadAll(resp.Body)
	var data map[string]interface{}
	json.Unmarshal(body, &data)
	publicIP := data["HTTP"]
	color.Red.Println(publicIP)
}
