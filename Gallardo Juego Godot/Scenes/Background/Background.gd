extends Node2D
var backSprites = []
var mult = []
var angle = 180;
var mag = 3
var y = -427
var x = 0
func _ready():
	backSprites = self.get_children()
	for n in  range(self.get_child_count()):
		mult.append(n+2)

		
	for n in range(backSprites.size()):
		backSprites[n].position = Vector2(0,0)
		backSprites[n].region_enabled = true
		backSprites[n].region_rect = Rect2(0,0,320,427)

	
func _physics_process(_delta): 
	x += sin(angle* PI/180)
	y += cos(angle* PI/180) 
	for n in range(backSprites.size()):
		backSprites[n].region_rect = Rect2(mult[n] * x,mult[n] * y,320,427)
