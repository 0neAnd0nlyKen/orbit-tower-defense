extends Node

var coins:int = 0
var score:int = 0
var goal:int

func _ready() -> void:
	goal = 20

func _process(_delta: float) -> void:
	if score >= goal:
		get_tree().paused = true

func _on_spawner_child_exiting_tree(_node: Node) -> void:
	score += 1
