extends CharacterBody2D

var speed = 150

func _physics_process(delta):
	gerak(delta)

func gerak(delta):
	var animasi = $AnimatedSprite2D
	velocity.x = speed
	velocity.y = 0
	animasi.play("idle")
	move_and_slide()
