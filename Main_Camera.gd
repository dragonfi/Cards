extends Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var camera_move_active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_MIDDLE:
			camera_move_active = event.pressed
	if event is InputEventMouseMotion:
		if camera_move_active:
			var transform = get_transform()
			transform = transform.rotated(Vector3(0, 1, 0), event.relative.x / 100.0)
			transform = transform.rotated(Vector3(1, 0, 0), event.relative.y / 100.0)
			print(event.relative)
			set_transform(transform)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
