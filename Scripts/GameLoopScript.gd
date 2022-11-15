extends Node2D

export (int) var gameSpeed

func _ready():
	_start_background()
	pass 

func _process(_delta):
	match $Player._get_player_state():
		0:#menu
			if Input.is_action_just_pressed("jump"):
				$Player._change_state(1)
				$Player._jump()
			_update_score_counter(" ")
			_set_UI_visibility(false, true, false, true)
			pass
		1:#alive
			_start_gameplay()
			_start_background()
			_update_score_counter($Player._get_score())
			_set_UI_visibility(true, false, false, false)
			pass
		2:#dead
			_stop_gameplay()
			_stop_background()
			_set_UI_visibility(false, false, true, true)
			_update_scores_post_game($Player._get_score())
			if $UI.retryPressed:
				_reset_game()
				$UI.retryPressed = false
			pass
	pass

func _update_score_counter(score) -> void:
	get_node("UI/ScoreCounter").text = str(score)

func _update_scores_post_game(score) -> void:
	get_node("UI/Score").text = "Score:" + str(score)
	_update_highscore(score)
	
func _update_highscore(score: int) -> void:
	if $SaveSystem.highscore < score:
		$SaveSystem._save_data(score)
	get_node("UI/Highscore").text = "Highscore:" + str($SaveSystem.highscore)

func _set_UI_visibility(score: bool, title: bool, retry: bool, highscore: bool) -> void:
	get_node("UI/ScoreCounter").visible = score
	get_node("UI/Title").visible = title
	get_node("UI/RetryButton").visible = retry
	get_node("UI/Highscore").visible = highscore
	get_node("UI/Score").visible = highscore

func _reset_game() -> void:
	for i in 5:
		get_node("Level/Pipes" + str(i+1))._reset()
	for i in 5:
		get_node("Background/Layer" + str(i+1) + "/Background" + str(i+1))._reset()
	$Level/Ground._reset()
	$Player._reset()

func _stop_gameplay() -> void:
	for i in 5:
		get_node("Level/Pipes" + str(i+1))._stop_pipe()
	$Level/Ground._stop_ground()

func _start_gameplay() -> void:
	for i in 5:
		get_node("Level/Pipes" + str(i+1))._start_pipe()
	$Level/Ground._start_ground()

func _start_background() -> void:
	for i in 5:
		var multiplier = 1 - 0.15 * (5 - i)
		get_node("Background/Layer" + str(i+1) +"/Background" + str(i+1))._start_layer(gameSpeed * multiplier)

func _stop_background() -> void:
	for i in 5:
		get_node("Background/Layer" + str(i+1) +"/Background" + str(i+1))._stop_layer()
