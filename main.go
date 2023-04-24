package main

import (
	"log"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	router.GET("/check", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "server is working -- after edit",
		})
	})

	log.Print("Listening for requests in :5050")
	router.Run(":5050")
}
