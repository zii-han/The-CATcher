extends Node2D

@onready var animasi = $AnimatedSprite2D

func _ready():
	animasi.flip_h = 1
	animasi.play("idle")
