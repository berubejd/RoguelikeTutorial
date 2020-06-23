extends Area2D

const character = '@'

onready var sprite = $Sprite


func _ready():
	set_sprite(character)


func set_sprite(value):
	var tmp = value.to_ascii()

	if sprite != null:
		var x = (tmp[0] % 16) * 24
		var y = (floor(tmp[0] / 16)) * 36
		sprite.region_rect = Rect2(x, y, 24, 36)
		
		sprite.position.x = get_viewport().size.x / 2
		sprite.position.y = get_viewport().size.y / 2
