extends CharacterBody2D

@export (int) var levelMoveSpeed
var velocity = Vector2()
var rng = RandomNumberGenerator.new()
var defaultPos

func _ready():
	velocity.x = levelMoveSpeed
	defaultPos = position.x
	pass 

func _process(delta):
	if position.x <= 256:
		position.x = 512
	move_and_collide(velocity * delta)
	pass

func _start_ground() -> void:
	velocity.x = levelMoveSpeed

func _stop_ground() -> void:
	velocity.x = 0

func _reset() -> void:
	position.x = defaultPos
