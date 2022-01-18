extends Node2D
var score: int
var power: int
func _process(_delta):
	$Player.activeWpns = $NumberOfWpns.value
	pass


func _on_BulletServer_collision_detected(bullet, colliders):
	#Gallardo tonto pasa esto a enums
	for i in range(colliders.size()):
		if(colliders[i].is_in_group("Player")):
			$"/root/Global".playerCollision = true
			bullet.pop()
		if(colliders[i].is_in_group("Enemies")):
			colliders[i].WasHitted(1)
		if(colliders[i].is_in_group("Wall")):
			bullet.pop()
	$"/root/Global".bulletCollision = true
