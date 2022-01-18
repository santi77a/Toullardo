extends StaticBody2D
var height = 427
var width = 320
var scalar = 9
var hitboxes = []

func _ready():
	hitboxes = self.get_children()
	hitboxes[0].position = Vector2((width/2 + scalar),0)
	hitboxes[0].shape.extents = Vector2(8, height/2)

	hitboxes[1].position = Vector2((width/2 + scalar)* -1,0)
	hitboxes[1].shape.extents = Vector2(8, height/2)
	
	hitboxes[2].position = Vector2(0,height/2 + scalar)
	hitboxes[2].shape.extents = Vector2(width/2,8)
	
	hitboxes[3].position = Vector2(0,(height/2 + scalar)*-1)
	hitboxes[3].shape.extents = Vector2(width/2,8)

