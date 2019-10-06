extends RigidBody

var hovering: bool = false
var grab_position := Vector3()

onready var pick_area = $"../PickArea"

func activate_hover(hover_position: Vector3):
	hovering = true
	grab_position = hover_position
	pick_area.activate_pick_area(hover_position.y)

func deactivate_hover():
	hovering = false
	pick_area.deactivate_pick_area()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if not event.pressed:
			deactivate_hover()

func _input_event(camera, event: InputEvent, pos: Vector3, normal: Vector3, shape):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			if event.pressed:
				activate_hover(pos + Vector3(0.0, 2.0, 0.0))

func _integrate_forces(state):
	pass

const HOVER_STRENGTH = 100.0
const DAMPEN_STRENGTH = 10.0

func _physics_process(dt):
	if hovering:
		angular_damp = 10.0
		var delta: Vector3 = grab_position - get_global_transform().origin
		#linear_damp = 0.5
		add_central_force(delta * HOVER_STRENGTH)
		add_central_force(- get_linear_velocity() * DAMPEN_STRENGTH)
	else:
		linear_damp = -1
		angular_damp = -1
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
