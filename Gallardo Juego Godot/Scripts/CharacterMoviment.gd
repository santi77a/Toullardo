extends KinematicBody2D

var shift = 30
var motion = Vector2()
var weapons = []
const speed = 13000
var localspeed = speed
var delay = 0.1
var activeWpns = 0

func _ready():
	weapons = [$Weapon,$Weapon2,$Weapon3,$Weapon4]
	pass

func _physics_process(delta):
	if($"/root/Global".playerCollision == true): 
		$"/root/Global".RestHealh()
		$"/root/Global".playerCollision = false
	ManageWeapons()
	Movement(delta)
	Shoot(delta)
	Shifting()
	WeaponPosition()
func Movement(delta):

	var vertical = Vector2(int(Input.is_action_pressed("ui_up")),int(Input.is_action_pressed("ui_down")))
	var horizontal = Vector2(int(Input.is_action_pressed("ui_left")),int(Input.is_action_pressed("ui_right")))
	
	motion.x = -horizontal.x + horizontal.y
	motion.y = -vertical.x + vertical.y
	if(motion.x != 0 and motion.y != 0):
		localspeed = localspeed/1.3
	move_and_slide(motion * localspeed * delta)
	
func Shoot(delta):
	
	if(Input.is_action_pressed("ui_shoot")):
		delay -= delta
		if(delay < 0):
			delay = 0.1
			$Shoot/Left.fire()
			$Shoot/Right.fire()
			for i in range(4):weapons[i].On_Shooting()
			
func Shifting():
	var target = 0
	if(Input.is_action_pressed("ui_shift")):
		$Hitbox/showHitbox.visible = true
		target = 15
		localspeed = speed/1.6
	else:
		$Hitbox/showHitbox.visible = false
		localspeed = speed
		target = 30
	shift += (target - shift) * 0.5
func ManageWeapons():
	for i in range(4):
		if(activeWpns < 1):weapons[i].isEnabled = false
		elif(i < activeWpns):weapons[i].isEnabled = true
		else:weapons[i].isEnabled = false
func WeaponPosition():
	var a = -45 - (45 * (activeWpns- 1) / 2)
	for i in range(activeWpns):
		a += 45
		var pos = Vector2(sin(a * PI / 180),cos(a * PI / 180)) * shift
		weapons[i].position += (pos -weapons[i].position) * 0.3
