extends Node

const SAVE_FILE = "user://save_file.save"
@export (int) var highscore

func _ready():
	_load_data()
	pass 

func _save_data(newScore: int) -> void:
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_16(newScore)
	highscore = newScore
	file.close()

func _load_data() -> void:
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		highscore = 0
		_save_data(highscore)
	file.open(SAVE_FILE,File.READ)
	highscore = file.get_16()
	file.close()
