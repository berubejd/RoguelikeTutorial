extends Node2D

onready var player = $Player


func _physics_process(_delta):
	pass


func _input(_event):
	if Input.is_action_just_pressed("ui_right"):
		player.move(Vector2(1, 0))
	
	if Input.is_action_just_pressed("ui_up"):
		player.move(Vector2(0, -1))
	
	if Input.is_action_just_pressed("ui_left"):
		player.move(Vector2(-1, 0))
	
	if Input.is_action_just_pressed("ui_down"):
		player.move(Vector2(0, 1))

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
