extends Sprite

var layerSpeed = 0

func _process(delta):
	position.x+= layerSpeed * delta
	if position.x <= -544:
		position.x = 1616
	pass
	
func _start_layer(speed) -> void:
	layerSpeed = speed

func _stop_layer() -> void:
	layerSpeed = 0
