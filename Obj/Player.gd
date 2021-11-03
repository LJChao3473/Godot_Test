extends KinematicBody2D


var speed = 200
var jump = 600
var gravity = 800

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	vel.x = 0
	vel.y += gravity*delta
	
	if Input.is_action_pressed("Left_WASD"):
		vel.x -= speed
	if Input.is_action_pressed("Right_WASD"):
		vel.x += speed
	#if Input.is_action_pressed("Down_WASD"):
	#	vel.y += speed
	if Input.is_action_pressed("Up_WASD") and is_on_floor():
		vel.y -= jump
	if Input.is_action_pressed("Down_WASD") and !is_on_floor():
		vel.y += speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
