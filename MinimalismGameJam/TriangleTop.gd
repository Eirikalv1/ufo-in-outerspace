extends KinematicBody2D

var height = RandomNumberGenerator.new()

func _ready():
	height.randomize()
	var pos2 = height.randi_range(200, 200)
	position.y = pos2
	if position.x == 0:
		position.x = get_node("/root/Node2D/CameraTrackingObject").position.x + 1920 + height.randi_range(-50, 50)

func _physics_process(delta) -> void:
	if position.x <= get_node("/root/Node2D/CameraTrackingObject").position.x -300:
		queue_free()
	position.y += 0.3
	
