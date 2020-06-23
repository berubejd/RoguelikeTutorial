extends Node2D

onready var player = $Player


func _input(event):
	if Input.is_action_just_pressed("ui_right"):
		player.global_position.x += 16
	
	if Input.is_action_just_pressed("ui_up"):
		player.global_position.y -= 16
	
	if Input.is_action_just_pressed("ui_left"):
		player.global_position.x -= 16
	
	if Input.is_action_just_pressed("ui_down"):
		player.global_position.y += 16

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
