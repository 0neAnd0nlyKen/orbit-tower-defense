extends CharacterBody2D
class_name Enemy

@export var pivotPoint:Node2D
@onready var hitbox:Area2D = $Area2D
@export var rotateSpeed:float = -0.2
@export var radius:float = 0
var rotateAngle:float = 0
var health:int = 15

func _ready() -> void:
	if pivotPoint == null:
		pivotPoint = $"../../PivotPoint"
	if hitbox == null:
		hitbox = $CollisionShape2D

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
	#print_debug("new position", position, rotateAngle, radius)

func _on_pivot_point_ready() -> void:
	pass # Replace with function body.

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "weapon" or area.name == "Area2D":
		health -= 5
		if health <= 0:
			queue_free()
		#print_debug("health is ", health)
	#print_debug(area.name)
