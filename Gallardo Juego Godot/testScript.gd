extends KinematicBody2D

var mov = Vector2()

func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov.y = delta * -200000
# warning-ignore:return_value_discarded
	move_and_slide(mov)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
