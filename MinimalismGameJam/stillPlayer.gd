extends KinematicBody2D

var velocity = Vector2(300, 30)
var jump = AudioStreamPlayer.new()
func _ready():
	position = Vector2(400, 450)

func _physics_process(delta) -> void:
	
	velocity.y += 15
	if position.y >= 600:
		velocity.y -= velocity.y + 450

	if position.x >= 2000:
		position.x = -100

	if velocity.y >= 300:
		$AnimatedSprite.play("fall")
	else:
		$AnimatedSprite.play("default")
	
	velocity = move_and_slide(velocity)
	




