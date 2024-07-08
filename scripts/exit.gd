extends Area2D

@onready var animated_aprite = $AnimatedSprite2D

func animate():
	animated_aprite.play("default")
