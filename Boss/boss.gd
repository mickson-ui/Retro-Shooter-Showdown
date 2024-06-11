extends CharacterBody2D

const SPEED = 300.0
const bulletPath = preload ("res://bullets.tscn")

var can_shoot = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# @onready var anim = get_node("AnimationPlayer")
var anim
var fire = false
	
func _ready():
	anim = get_node("AnimatedSprite2D")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Check if fire is true then play animation
	if fire:
		anim.play("Breath")
	else:
		anim.play("Idle")

	#move_and_slide()

func _on_player_detection_body_entered(body: Node2D):
	if body.name == "Player":
		shoot()
		fire = true

func _on_player_detection_body_exited(body: Node2D):
	if body.name == "Player":
		fire = false

func shoot():
	if not can_shoot:
		return
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = $Marker2D.global_position # Use global_position to ensure correct positioning
