extends Area2D
var states: int


func _ready():
	pass
func _physics_process(delta):
	
	translate(Vector2.DOWN * 100 * delta)
	match states:
		1:
			$AnimatedSprite.play("BigPower")
		2:
			$AnimatedSprite.play("BigScore")
		3:
			$AnimatedSprite.play("SmallPower")
		4:
			$AnimatedSprite.play("SmallScore")
	pass
func set_state(NewState: int):
	states = NewState
