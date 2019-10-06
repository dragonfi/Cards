extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var rigid_body = $RigidBody
var init_pos = null

func set_origin(pos: Vector3):
	init_pos = pos
# Called when the node enters the scene tree for the first time.
func _ready():
	if init_pos:
		var transform = rigid_body.get_transform()
		transform.origin = init_pos
		rigid_body.set_global_transform(transform)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rigid_body.get_transform().origin.y < -10.0:
		var parent = get_parent()
		parent.remove_child(self)
		self.free()
