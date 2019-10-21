extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

export (int) var acceleration = 100
export (float) var speed = 0
export (int) var engine_power = 200
export (float) var rotation_speed = 1350

# Use Rigidbody's angular damp to slow down rotation.

#export (float) var friction = 0.1

func _ready():
	pass # Replace with function body.

var velocity = Vector2()
var rotation_dir = 0
	
func get_input():
	rotation_dir = 0
	speed = 0
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		rotation_dir = 1
	if Input.is_action_pressed('left'):
		rotation_dir = -1
	if Input.is_action_pressed('down'):
		speed = -1
		#velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed('up'):
		speed = 1
	
	#velocity = Vector2(speed * enginepower, 0).rotated(rotation)
	
func _physics_process(delta):
	

	get_input()
	
	# nopeus
	#if (speed == 80):
	#	apply_central_impulse(Vector2(5, 0).rotated(rotation))
	
		
	# Transforming stuffs from Unity. Transform.Up is the direction an object is pointing to in Unity
	# In Godot, it is Vector2.RIGHT rotated towards rotation.
	var forwards_velocity = Vector2.RIGHT.rotated(rotation) * linear_velocity.dot(Vector2.RIGHT.rotated(rotation))
	var sideways_velocity = Vector2.UP.rotated(rotation) * linear_velocity.dot(Vector2.UP.rotated(rotation))
	#print(liirtospiidi)
	
	#rotation += rotation_dir * rotation_speed * delta
	#velocity = move_and_slide(velocity)
	#set_applied_force()

	#print(Vector2(speed, 0).rotated(rotation))

	set_applied_force(Vector2(speed * engine_power, 0).rotated(rotation))
	set_linear_velocity(forwards_velocity + sideways_velocity * 0.95)
	
	set_applied_torque(rotation_dir * rotation_speed)
