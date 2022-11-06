extends KinematicBody2D

export (int) var levelMoveSpeed
var velocity = Vector2()
var rng = RandomNumberGenerator.new()

func _ready():
	_randomise_height()
	pass 

func _physics_process(delta):
	move_and_collide(velocity * delta)
	pass

func _process(_delta):
	if position.x <= -50:
		position.x = 1000
		_randomise_height()
	pass

func _randomise_height() -> void:
	rng.randomize()
	position.y = rng.randi_range(160,400)

func _start_pipe() -> void:
	velocity.x = levelMoveSpeed

func _stop_pipe() -> void:
	velocity.x = 0
