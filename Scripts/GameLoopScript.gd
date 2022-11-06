extends Node2D

export (int) var gameSpeed

var score = 0

func _ready():
	_start_background()
	pass 

func _process(_delta):
	match $Player._get_player_state():
		0:#menu
			if Input.is_action_just_pressed("jump"):
				$Player._change_state(1)
				$Player._jump()
			pass
		1:#alive
			_start_gameplay()
			_start_background()
			score = $Player._get_score()
			pass
		2:#dead
			_stop_gameplay()
			_stop_background()
			pass
	pass

func _stop_gameplay() -> void:
	$Level/Pipes._stop_pipe()
	$Level/Pipes2._stop_pipe()
	$Level/Pipes3._stop_pipe()
	$Level/Pipes4._stop_pipe()
	$Level/Pipes5._stop_pipe()
	$Level/Ground._stop_ground()
	$Level/Ground2._stop_ground()
	$Level/Ground3._stop_ground()
	$Level/Ground4._stop_ground()

func _start_gameplay() -> void:
	$Level/Pipes._start_pipe()
	$Level/Pipes2._start_pipe()
	$Level/Pipes3._start_pipe()
	$Level/Pipes4._start_pipe()
	$Level/Pipes5._start_pipe()
	$Level/Ground._start_ground()
	$Level/Ground2._start_ground()
	$Level/Ground3._start_ground()
	$Level/Ground4._start_ground()

func _start_background() -> void:
	$Background/Layer5/Background5._start_layer(gameSpeed)
	$Background/Layer5/Background5_1._start_layer(gameSpeed)
	$Background/Layer4/Background4._start_layer(gameSpeed * 0.85)
	$Background/Layer4/Background4_1._start_layer(gameSpeed * 0.85)
	$Background/Layer3/Background3._start_layer(gameSpeed * 0.7)
	$Background/Layer3/Background3_1._start_layer(gameSpeed * 0.7)
	$Background/Layer2/Background2._start_layer(gameSpeed * 0.55)
	$Background/Layer2/Background2_1._start_layer(gameSpeed * 0.55)
	$Background/Layer1/Background1._start_layer(gameSpeed * 0.4)
	$Background/Layer1/Background1_1._start_layer(gameSpeed * 0.4)

func _stop_background() -> void:
	$Background/Layer5/Background5._stop_layer()
	$Background/Layer5/Background5_1._stop_layer()
	$Background/Layer4/Background4._stop_layer()
	$Background/Layer4/Background4_1._stop_layer()
	$Background/Layer3/Background3._stop_layer()
	$Background/Layer3/Background3_1._stop_layer()
	$Background/Layer2/Background2._stop_layer()
	$Background/Layer2/Background2_1._stop_layer()
	$Background/Layer1/Background1._stop_layer()
	$Background/Layer1/Background1_1._stop_layer()
