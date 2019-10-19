extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

export (int) var speed = 200
export (float) var rotation_speed = 1.5

func _ready():
	pass # Replace with function body.

var velocity = Vector2()
var rotation_dir = 0
	
func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		rotation_dir += 1
	if Input.is_action_pressed('left'):
		rotation_dir -= 1
	if Input.is_action_pressed('down'):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed('up'):
		velocity = Vector2(speed, 0).rotated(rotation)
	
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
