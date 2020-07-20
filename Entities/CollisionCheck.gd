extends Position2D

onready var raycast = $RayCast2D

func is_not_colliding(target: Vector2):
	raycast.cast_to = target * 24
	raycast.force_raycast_update()
	return not raycast.is_colliding()
