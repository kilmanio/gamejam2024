extends Node2D

var scene_to_instance = preload("res://block.tscn")
var timeout = 0
const SHIP_SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timeout -= delta
	if Input.is_action_pressed("ui_down") && timeout <= 0:
		spawn_block()
	
	match [Input.is_action_pressed("ui_left"), Input.is_action_pressed("ui_right")]:
		[true, false]: $ship.velocity.x = -SHIP_SPEED
		[false, true]: $ship.velocity.x = SHIP_SPEED
		_: $ship.velocity.x = 0
	


func spawn_block():
	var object = scene_to_instance.instantiate()
	object.position = $ship.position
	call_deferred("add_child",object)
	timeout = 1
