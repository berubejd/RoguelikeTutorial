extends Area2D

enum tiles {
	ALL,
	FLOOR,
	WALL
}

export (Vector2) var entity_position
export (String) var character
export (int) var color_r
export (int) var color_g
export (int) var color_b
export (int) var color_a = 1

onready var collision_check: = $CollisionCheck
onready var map: = get_tree().get_root().find_node("Map", true, false)
onready var sprite: = $Sprite

var last_position: Vector2
var orig_tile: int


func _ready():
	init_sprite()


func init_sprite():
	var tmp = character.to_ascii()

	if sprite != null and map != null:
		var x = (tmp[0] % 16) * 24
		var y = (floor(tmp[0] / 16)) * 36
		sprite.region_rect = Rect2(x, y, 24, 36)

		sprite.self_modulate = Color(color_r, color_g, color_b, color_a)

		# Place entity in the world and remove and save underlying tile
		position = map.map_to_world(Vector2(entity_position))
		orig_tile = map.get_cellv(entity_position)
		map.set_cellv(entity_position, -1)


func move(move_vector: Vector2):
	var new_position: Vector2 = Vector2(move_vector.x * 24, move_vector.y * 36)
	if collision_check.is_not_colliding(move_vector):
		# Save original position prior to move
		last_position = entity_position
		
		# Update entity_position and use that to update world position
		entity_position += move_vector
		position = map.map_to_world(entity_position)
		
		# Correct tilemap
		tile_swap(last_position, entity_position)


func tile_swap(old_postion: Vector2, new_position: Vector2):
	# Replace original tile
	map.set_cellv(old_postion, orig_tile)

	# Save tile from new position and clear that tile
	orig_tile = map.get_cellv(new_position)
	map.set_cellv(new_position, -1)
