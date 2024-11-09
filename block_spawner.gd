extends Node

var scene_to_instance = preload("res://block.tscn")
var timer = 1

# Called when the node enters the scene tree for the first 4time.
func _ready() -> void:
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Left/Area2D.has_overlapping_bodies() || $Right/Area2D.has_overlapping_bodies():
		timer = 5
	else:
		timer -= delta
		
	if timer <= 0:
		timer = 5
		spawn_block()

func spawn_block():
	var object = scene_to_instance.instantiate()
	object.position.y = $Left.position.y
	if randi() % 2 == 0:
		object.position.x = $Right.position.x
	else:
		object.position.y = $Left.position.y
	
	call_deferred("add_child",object)
