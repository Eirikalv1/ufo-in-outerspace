extends KinematicBody2D

var height = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
var hit = AudioStreamPlayer.new()
var distance2 : int

func _ready():
	self.add_child(hit)
	hit.stream = load("res://hit.wav")
	hit.volume_db = -15

func _physics_process(delta) -> void:
	$AnimatedSprite.play("default")
	velocity = move_and_slide(Vector2(-600 * Global.speed123, 0))
	for body in $Area2D.get_overlapping_bodies():
		if body.name == "Player":
			visible = false
			hit.play()

			get_node("/root/Node2D/Color/ColorRect2").rect_scale.y = 1
			get_node("/root/Node2D/Color/CollisionPolygon2D").position.y = -46
			
			get_node("/root/Node2D/Color2/ColorRect3").rect_scale.y = 1
			get_node("/root/Node2D/Color2/CollisionPolygon2D2").position.y = 51
			get_node("/root/Node2D/Color2").position.y = 0

func _on_Timer3_timeout():
	position.x = get_node("/root/Node2D/CameraTrackingObject").position.x + 2000
	visible = true
	height.randomize()
	distance2 = 1080 - 156 - (get_node("/root/Node2D/Color/CollisionPolygon2D").position.y * 2)
	var _pos = height.randi_range(460 + (distance2/2), 640 - (distance2/2))
	position.y = _pos
