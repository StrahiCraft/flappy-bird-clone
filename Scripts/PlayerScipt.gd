extends KinematicBody2D

export (int) var fallingSpeed
export (int) var jumpHeight
export (float) var rotationStrength

var velocity = Vector2()

func _physics_process(delta):
	_rotatePlayer(delta)
	_movePlayer(delta)
	pass

func _process(delta):	
	_updateVelocity(delta)
	
	if Input.is_action_just_pressed("jump"):
		_jump()
		
	if velocity.y > -jumpHeight/1.2:
		$AnimatedSprite.stop()
		$AnimatedSprite.play("fall")
	pass
	
func _jump():
	velocity.y = -jumpHeight
	$AnimatedSprite.play("flap")
	pass

func _updateVelocity(delta):
	velocity.y += fallingSpeed * delta
	pass

func _movePlayer(delta):
	move_and_collide(velocity * delta)
	pass

func _rotatePlayer(delta):
	rotation = velocity.y * rotationStrength * delta
	pass
