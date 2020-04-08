extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#func _physics_process(delta):
#	var direction = 0
#	if Input.is_action_pressed("ui_right"):
#		direction += 1
#	if Input.is_action_pressed("ui_left"):
#		direction -= 1
#
#	move_and_slide(Vector2(direction * 20, 30), Vector2.UP)
#	$Label.text = str(position.y)
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass

var tile_size = 64

export (int) var speed = 200

var target = Vector2.ZERO
var velocity = Vector2()

func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()

		target.x = (ceil(target.x / tile_size) - 1) * tile_size
		target.y = (ceil(target.y / tile_size) - 1) * tile_size
		print(target)
		


func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 1:
		print(position.distance_to(target))
		velocity = move_and_slide(velocity)
