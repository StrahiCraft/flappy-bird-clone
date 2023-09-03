extends CharacterBody2D

@export (int) var levelMoveSpeed
var velocity = Vector2()
var rng = RandomNumberGenerator.new()

var defaultPos

func _ready():
	defaultPos = position.x
	_randomise_height()
	pass 

func _process(delta):
	move_and_collide(velocity * delta)
	if position.x <= -48:
		position.x = 998
		_randomise_height()
	pass

func _randomise_height() -> void:
	rng.randomize()
	position.y = rng.randi_range(160,400)

func _start_pipe() -> void:
	velocity.x = levelMoveSpeed

func _stop_pipe() -> void:
	velocity.x = 0

func _reset() -> void:
	position.x = defaultPos
	_randomise_height()
