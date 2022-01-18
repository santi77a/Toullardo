extends Sprite
var isEnabled = true
func _process(_delta):
	EnableSprite()
	
	# this function is called in the player
func On_Shooting():
	if(isEnabled):
		$BulletSpawner.fire()
		#shoot
		pass
	
func EnableSprite():
	self.visible = isEnabled
