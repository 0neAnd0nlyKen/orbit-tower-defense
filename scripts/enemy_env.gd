extends Node2D

@export var pivotPoint: Node2D
@export var spawner: EnemySpawner
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (spawner and pivotPoint):
		spawner.radius = -(spawner.global_position.distance_to(pivotPoint.global_position))
	else:
		print("WHERE")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
