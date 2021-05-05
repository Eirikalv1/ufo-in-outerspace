extends StaticBody2D

func _physics_process(delta) -> void:
	position.x = get_node("/root/Node2D/CameraTrackingObject").position.x 
	position.y -= 0.235
	$ColorRect3.rect_scale.y += 0.003
