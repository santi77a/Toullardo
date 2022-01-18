extends Area2D
class_name Enemy
var Item = preload("res://Scenes/item/Item.tscn")
var enemyHealth = 40


func _ready():
	pass

func _physics_process(_delta):
	DeathCheck(80)

func WasHitted(dmg: int):
	enemyHealth -= dmg


func DeathCheck(lootAmaunt: int):
	if(enemyHealth < 1 ):
		while lootAmaunt > 0: 
			var itemValue = rand_range(1,4)

			if(itemValue < lootAmaunt ):
				lootAmaunt -= itemValue
			else: 
				lootAmaunt -= 1

			var x = rand_range(-25,25)
			var y = rand_range(-25,25)

			var newItem = Item.instance()
			get_parent().add_child(newItem)

			newItem.set_state(itemValue)
			newItem.position = self.position + Vector2(x,y)

		self.queue_free()
