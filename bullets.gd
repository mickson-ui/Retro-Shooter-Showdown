extends CharacterBody2D

var speed = 500

func _ready():
    pass

func _physics_process(delta):
    position.x += speed * delta
