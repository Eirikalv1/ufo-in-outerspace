extends Node2D

func _physics_process(delta) -> void:
	position.x = get_node("/root/Node2D/CameraTrackingObject").position.x
	$ColorRect2.rect_scale.y += 0.003
	$CollisionPolygon2D.position.y += 0.235


