extends StaticBody2D


func _ready():
	if Global.equiped == false:
		$Button/Sprite.visible = false
	else:
		$Button/Sprite.visible = true
	
	if Global.unlocked == false:
		$Label.visible = true
		$StaticBody2D/Label2.visible = true
		$AnimatedSprite2.visible = false
		$AnimatedSprite.play("default")
		$StaticBody2D/Label2.visible = false
	else:
		$AnimatedSprite2.visible = true
		$AnimatedSprite2.play("default")
		$AnimatedSprite.visible = false
		$Label.visible = false
		$StaticBody2D/Label2.visible = true



	
