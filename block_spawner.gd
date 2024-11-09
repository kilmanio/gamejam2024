extends Node2D

var scene_to_instance = preload("res://block.tscn")
var timer = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Area2D.has_overlapping_bodies():
		timer = 5
	else:
		timer -= delta
		
	if timer <= 0:
		timer = 5
		spawn_block()

func spawn_block():
	var object = scene_to_instance.instantiate()
	call_deferred("add_child",object)
