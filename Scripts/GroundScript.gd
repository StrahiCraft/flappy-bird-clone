extends KinematicBody2D

export (int) var levelMoveSpeed
var velocity = Vector2()
var rng = RandomNumberGenerator.new()

func _ready():
	velocity.x = levelMoveSpeed
	pass 

func _process(delta):
	if position.x <= -512:
		position.x = 1536
	move_and_collide(velocity * delta)
	pass

func _start_ground() -> void:
	velocity.x = levelMoveSpeed

func _stop_ground() -> void:
	velocity.x = 0
