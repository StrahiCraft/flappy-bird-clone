extends Node2D


func _ready():
	
	pass 

func _process(delta):
	match $Player._get_player_state():
		0:#menu
			if Input.is_action_just_pressed("jump"):
				$Player._change_state(1)
				$Player._jump()
			pass
		1:#alive
			_start_game()
			pass
		2:#dead
			_stop_game()
			pass
	pass

func _stop_game() -> void:
	$Level/Pipes._stop_pipe()
	$Level/Pipes2._stop_pipe()
	$Level/Pipes3._stop_pipe()
	$Level/Pipes4._stop_pipe()
	$Level/Pipes5._stop_pipe()

func _start_game() -> void:
	$Level/Pipes._start_pipe()
	$Level/Pipes2._start_pipe()
	$Level/Pipes3._start_pipe()
	$Level/Pipes4._start_pipe()
	$Level/Pipes5._start_pipe()
