extends Node2D

var scene_to_instance = preload("res://block.tscn")
var timeout = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timeout -= delta
	if Input.is_action_pressed("ui_text_toggle_insert_mode") && timeout <= 0:
		spawn_block()
	


func spawn_block():
	var object = scene_to_instance.instantiate()
	object.position = $ship.position
	object.position.y += 100
	call_deferred("add_child",object)
	timeout = 1
