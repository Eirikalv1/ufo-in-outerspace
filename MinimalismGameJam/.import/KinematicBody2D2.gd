extends KinematicBody2D

var location = RandomNumberGenerator.new()

func _ready():
	location.randomize()

	var pos1 = location.randi_range(840, 840)
	position.y = pos1
	
	if position.x == 0:
		position.x = get_node("/root/Node2D/CameraTrackingObject").position.x + 1920 + location.randi_range(-50, 50)

func _physics_process(delta) -> void:
	if position.x <= get_node("/root/Node2D/CameraTrackingObject").position.x -300:
		queue_free()
	position.y -= 0.3
