extends KinematicBody2D

export (int) var fallingSpeed
export (int) var jumpHeight
export (float) var rotationStrength

var currentState = PlayerState.Alive

enum PlayerState{
	Menu,
	Alive,
	Dead
}

var velocity = Vector2()

func _ready():
	currentState = PlayerState.Menu
	$AnimatedSprite.play("menu")
	pass

func _physics_process(delta):
	match currentState:
		PlayerState.Menu:
			pass
		PlayerState.Alive:
			_rotate_player(delta)
			_move_player()
			pass
		PlayerState.Dead:
			_move_player()
			pass
	pass

func _process(delta):
	match currentState:
		PlayerState.Menu:
			pass
		PlayerState.Alive:
			_update_velocity(delta)
			if Input.is_action_just_pressed("jump"):
				_jump()
			if velocity.y > -jumpHeight / 1.2:
				$AnimatedSprite.stop()
				$AnimatedSprite.play("fall")
			pass
		PlayerState.Dead:
			velocity.y = jumpHeight
			pass
	pass
	
func _jump() -> void:
	velocity.y = -jumpHeight
	$AnimatedSprite.play("flap")

func _update_velocity(delta) -> void:
	velocity.y += fallingSpeed * delta

func _move_player() -> void:
	move_and_slide(velocity)

func _rotate_player(delta) -> void:
	rotation = velocity.y * rotationStrength * delta


func _on_ObsticleDetector_body_entered(body):
	_change_state(2)
	pass

func _change_state(newState: int) -> void:
	currentState = newState

func _get_player_state() -> int:
	return currentState
