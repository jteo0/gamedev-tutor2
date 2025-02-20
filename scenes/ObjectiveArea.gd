extends Area2D

@onready var line = %ObjectiveBorder
var blue_in = false
var green_in = false

var start_pos: Vector2
var end_pos: Vector2 = Vector2(0, 0)
var move_time: float = 2.0

var can_print = true

func _ready():
	start_pos = position 
	move_to_end()
	blink()

func move_to_end():
	var tween = create_tween()
	tween.tween_property(self, "position", end_pos, move_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_callback(move_to_start)

func move_to_start():
	var tween = create_tween()
	tween.tween_property(self, "position", start_pos, move_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_callback(move_to_end)

func blink():
	var tween = create_tween()
	tween.tween_property(line, "modulate", Color(1, 1, 1, 0), 0.8)
	tween.tween_property(line, "modulate", Color(1, 1, 1, 1), 0.1)
	tween.tween_callback(blink)

func _on_ObjectiveArea_body_entered(body: PhysicsBody2D):
	if body.name == "BlueShip":
		blue_in = true
	elif body.name == "GreenShip":
		green_in = true
	blue_and_green()
	ship_timer()

func _on_ObjectiveArea_body_exited(body: PhysicsBody2D):
	if body.name == "BlueShip":
		blue_in = false
	elif body.name == "GreenShip":
		green_in = false
	blue_and_green()
	ship_timer()

func blue_and_green():
	if not can_print:
		return
	
	if blue_in and green_in:
		print("Reached objective!")
	else:
		print("Waiting for other ship.")
	
	can_print = false
	await get_tree().create_timer(1.0).timeout 
	can_print = true 

func ship_timer():
	if (blue_in and not green_in) or (not blue_in and green_in):
		await get_tree().create_timer(2.0).timeout

		if (blue_in and not green_in) or (not blue_in and green_in):
			if blue_in:
				blue_in = false
			elif green_in:
				green_in = false
			
			print("You have a window of two seconds to make sure both ships reach the objective!")
