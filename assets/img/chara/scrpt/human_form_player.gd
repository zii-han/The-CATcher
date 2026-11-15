extends CharacterBody2D

var speed = 150
var gravity = 980
var jump_force = -400
var kondisi = "idle"

func _physics_process(delta):
	gerak(delta)

func gerak(delta):
	# GRAVITASI
	if not is_on_floor():
		velocity.y += gravity * delta

	# LOMPAT (SPACE)
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force

	# GERAK KANAN
	if Input.is_action_pressed("ui_right"):
		kondisi = "kanan"
		velocity.x = speed

	# GERAK KIRI
	elif Input.is_action_pressed("ui_left"):
		kondisi = "kiri"
		velocity.x = -speed

	else:
		velocity.x = 0
		kondisi = "idle"

	# SERANG
	if Input.is_action_pressed("ui_down"):
		kondisi = "serang"

	setAnimasi(kondisi)
	move_and_slide()

func setAnimasi(arah):
	var animasi = $AnimatedSprite2D

	if arah == "idle":
		animasi.play("idle")

	elif arah == "kanan":
		animasi.flip_h = false
		animasi.play("gerak")

	elif arah == "kiri":
		animasi.flip_h = true
		animasi.play("gerak")

	elif arah == "serang":
		animasi.play("serang")

func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("box"):
		area.queue_free()
