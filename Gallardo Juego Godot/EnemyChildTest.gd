extends Enemy
var SharpVBullet = preload("res://Sprites/bullets/sharp_Violet.png")
var SharpRBullet = preload("res://Sprites/bullets/sharp_red.png")
enum State{
	idle,
	moveL,
	moveR,
	shoot,
}

var state = State.idle
var time = 0
var constTime = 0

func _ready():
	state = State.idle
	pass

func _physics_process(delta):
	time += delta

	match state:
		State.idle:
			$BulletSpawner.autofire = false
			state = State.moveL
		State.moveL:
			
			constTime = 1
			translate(Vector2.LEFT * delta * 115)
			ChangeStateInTime(State.moveR)
		State.moveR:
			
			constTime = 1
			translate(Vector2.RIGHT * delta * 115)
			ChangeStateInTime(State.shoot)
		State.shoot:
			
			constTime = 10
			Patter1()
			ChangeStateInTime(State.idle)

func ChangeStateInTime(_state):
	if(time > constTime):
		time = 0
		state = _state

func Patter1():
	if($BulletSpawner.autofire != true):$BulletSpawner.autofire = true
	$BulletSpawner.aim_angle +=1
	if($BulletSpawner.bullet_type.texture == SharpVBullet):
		$BulletSpawner.bullet_type.texture = SharpRBullet
	else: $BulletSpawner.bullet_type.texture = SharpVBullet
