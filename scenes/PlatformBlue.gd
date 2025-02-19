extends Node2D

@export var speed = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Get both ships into the square within 5 seconds!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up_w"):
		move_local_y(-speed * delta, false)
	
	if Input.is_action_pressed("down_s"):
		move_local_y(speed * delta, false)
		
	if Input.is_action_pressed("left_a"):
		move_local_x(-speed * delta, false)
	
	if Input.is_action_pressed("right_d"):
		move_local_x(speed * delta, false)
