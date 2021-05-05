extends KinematicBody2D

var spawnpoint = RandomNumberGenerator.new()
var distance : int
var pos : float

func _ready():
	spawnpoint.randomize()
	pos = spawnpoint.randf_range(-0.4, 0.4)
	distance = 1080 - 156 - (get_node("/root/Node2D/Color/CollisionPolygon2D").position.y * 2)
	var spawn = spawnpoint.randi_range(460 + (distance/2), 640 - (distance/2)) 
	position = Vector2(get_node("/root/Node2D/CameraTrackingObject").position.x + 2000, spawn)

func _physics_process(delta) -> void:
	position.x -= 13 * Global.speed123
	
	if position.x <= -200:
		queue_free()
	$AnimatedSprite.rotation +=  pos * delta * 10
	if pos >= 0.2:
		$AnimatedSprite.play("tv")
	elif pos >= 0 and pos <= 0.2:
		$AnimatedSprite.play("trash")
	elif pos >= -0.2 and pos <= 0:
		$AnimatedSprite.play("cd")
	else:
		$AnimatedSprite.play("barrel")
