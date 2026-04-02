extends CharacterBody2D

@export var weapon: Node2D
@export var orbit_radius: float = 100.0
@export var orbit_speed: float = 2.0  # radians per second

var isDragging = false
var orbit_angle: float = 0.0

func _ready():
	# Make sure we have a weapon reference
	if weapon == null:
		weapon = $weapon
	
	# Set initial weapon position
	_update_weapon_position()

func _process(delta: float) -> void:
	if isDragging:
		position = get_global_mouse_position()
	
	# Update orbit angle
	orbit_angle += orbit_speed * delta
	
	# Keep angle within reasonable range
	if orbit_angle > PI * 2:
		orbit_angle -= PI * 2
	
	# Update weapon position
	_update_weapon_position()

func _update_weapon_position():
	if weapon:
		# Calculate orbit position relative to this node
		var orbit_position = Vector2(
			cos(orbit_angle) * orbit_radius,
			sin(orbit_angle) * orbit_radius
		)
		
		# Set weapon position relative to this node
		weapon.position = orbit_position

func _on_button_button_down() -> void:
	isDragging = true 

func _on_button_button_up() -> void:
	isDragging = false
