extends Node2D
class_name EnemySpawner
@export var spawnPoint:Node2D
@export var enemy:  = preload("res://scenes/enemy.tscn")
@export var maxEnemies: int = 5
@export var spawnRate: float = 2.0
@export var radius: float = 0

var spawnTimer: float = 0.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	spawnTimer += delta
	
	if spawnTimer >= spawnRate:
		spawnTimer = 0.0
		if get_child_count() < maxEnemies:
			var newEnemy: Enemy = enemy.instantiate()
			newEnemy.radius = radius
			add_child(newEnemy)
			newEnemy.position = spawnPoint.global_position  # or set a spawn position
