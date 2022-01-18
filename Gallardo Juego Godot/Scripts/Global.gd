extends Node
var bulletCollision = false
var playerCollision = false
var playerHealh = 4
enum PlayerShootType{
	focused,
	spread,
}

func _ready():
	randomize()

func RestHealh():
	GameOver()
	if(playerHealh > 0): playerHealh -= 1

func AddLives(): playerHealh += 1

func GameOver():
	if(playerHealh < 1):
		print("GameOver")
