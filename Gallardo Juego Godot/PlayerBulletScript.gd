extends Area2D
var dir = Vector2()
var angle = 360
const SPEED = 2500


func _physics_process(delta):
	dir = Vector2(sin(angle * PI/180),cos(angle * PI/180))
	position += dir * SPEED * delta
	look_at(dir)



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
