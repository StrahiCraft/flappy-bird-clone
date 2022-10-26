extends KinematicBody2D

export (int) var fallingSpeed
export (int) var jumpHeight
export (float) var rotationStrength

var velocity = Vector2()

func _physics_process(delta):
	_rotate_player(delta)
	_move_player()
	pass

func _process(delta):
	_update_velocity(delta)
	
	if Input.is_action_just_pressed("jump"):
		_jump()
		
	if velocity.y > -jumpHeight / 1.2:
		$AnimatedSprite.stop()
		$AnimatedSprite.play("fall")
	pass
	
func _jump():
	velocity.y = -jumpHeight
	$AnimatedSprite.play("flap")
	pass

func _update_velocity(delta):
	velocity.y += fallingSpeed * delta
	pass

func _move_player():
	move_and_slide(velocity)
	pass

func _rotate_player(delta):
	rotation = velocity.y * rotationStrength * delta
	pass
