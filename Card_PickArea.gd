extends Area

onready var rigid_body = $"../RigidBody"

func activate_pick_area(height):
	input_ray_pickable = true
	var transform = get_global_transform()
	transform.origin.y = height
	set_global_transform(transform)
	print(get_global_transform())
	pass

func deactivate_pick_area():
	input_ray_pickable = false
	pass

func _input_event(camera, event: InputEvent, pos: Vector3, normal: Vector3, shape):
	if event is InputEventMouseMotion:
		rigid_body.grab_position.x = pos.x
		rigid_body.grab_position.z = pos.z

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
