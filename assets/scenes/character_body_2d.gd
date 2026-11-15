extends Node2D

@onready var animasi = $AnimatedSprite2D

func _ready():
	animasi.flip_h = 0
	animasi.play("idle")
