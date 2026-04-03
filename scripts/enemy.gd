extends CharacterBody2D

class_name Enemy
@export var pivotPoint:Node2D
@export var rotateSpeed:float = -0.2
@export var radius:float = 0
var rotateAngle:float = 0

func _ready() -> void:
	if pivotPoint == null:
		pivotPoint = $"../../PivotPoint"
	
	#radius = position.distance_to(pivotPoint.position)
	#UpdateRotation()

func _process(delta: float) -> void:
	rotateAngle += rotateSpeed * delta
	
	if rotateAngle > PI * 2:
		rotateAngle -= PI * 2
	
	UpdateRotation()

func UpdateRotation():
	position = Vector2(
		cos(rotateAngle) * radius, 
		sin(rotateAngle) * radius)
	position.x += -radius
	print_debug("new position", position, rotateAngle, radius)


func _on_pivot_point_ready() -> void:
	pass # Replace with function body.
