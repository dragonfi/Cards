extends StaticBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(camera, event: InputEvent, pos: Vector3, normal: Vector3, shape):
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
			if event.pressed:
				$"..".emit_signal("table_clicked", pos)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
