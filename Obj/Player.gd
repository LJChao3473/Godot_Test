extends KinematicBody2D


var speed = 200
var jump = 400
var gravity = 800
var jumpCount = 1

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	vel.x = 0
	vel.y += gravity*delta

	#Move RL
	if Input.is_action_pressed("Left_WASD"):
		vel.x -= speed
	if Input.is_action_pressed("Right_WASD"):
		vel.x += speed

	if is_on_floor():
		jumpCount = 1

	#Jump + Double Jump
	if Input.is_action_just_pressed("Up_WASD"):
		if is_on_floor():
			vel.y -= jump
		elif jumpCount == 1:
			vel.y -= jump
			jumpCount = 0
	
		
	if Input.is_action_pressed("Down_WASD") and !is_on_floor():
		vel.y += speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
