extends Node

var coins:int = 0
var score:int = 0
var goal:int = 20
var countdown:float = 0.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if score >= goal:
		#get_tree().paused = true
		countdown += delta
		if countdown >= 3.0:
			levelUp()

func _on_spawner_child_exiting_tree(_node: Node) -> void:
	score += 1
	print_debug(score)

func levelUp():
	#get_tree().paused = false
	get_tree().reload_current_scene()
	goal += goal%2
	print_debug(goal)
