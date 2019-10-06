extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func create_new_card(pos: Vector3):
	var card = preload("res://Card.tscn").instance()
	card.set_origin(pos)
	add_child(card)
	print("creating card at", pos, "total child:", get_child_count())


func _on_Table_table_clicked(pos: Vector3):
	pos.y += 8.0;
	create_new_card(pos)
