extends CharacterBody2D


var isDragging = false
func _process(delta: float) -> void:
	if isDragging:
		position = get_global_mouse_position()
func _on_button_button_down() -> void:
	isDragging = true 

func _on_button_button_up() -> void:
	isDragging = false
