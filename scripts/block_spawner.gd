extends Node

var block_1 = preload("res://scenes/blocks/1.tscn")
var block_2 = preload("res://scenes/blocks/2.tscn")
var block_3 = preload("res://scenes/blocks/3.tscn")
var block_4 = preload("res://scenes/blocks/4.tscn")

var timer = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Left/Area2D.has_overlapping_bodies() || $Right/Area2D.has_overlapping_bodies():
		timer = 3
		$Left/portal/AnimatedSprite2D.modulate = Color(0.55, 0.16, 0.84, 1)
		$Right/portal/AnimatedSprite2D.modulate = Color(0.55, 0.16, 0.84, 1)
		
	else:
		timer -= delta
		$Left/portal/AnimatedSprite2D.modulate = Color(0, 1, 0.84, 1)
		$Right/portal/AnimatedSprite2D.modulate = Color(0, 1, 0.84, 1)
		
	if timer <= 0:
		timer = 3
		spawn_block()

func choose_block() -> Node:
	match randi() % 4:
		0: return block_1.instantiate()
		1: return block_2.instantiate()
		2: return block_3.instantiate()
		_: return block_4.instantiate()

func spawn_block():
	var object = choose_block()
	
	object.position.y = $Left.position.y
	if randi() % 2 == 0:
		object.position.x = $Right.position.x
	else:
		object.position.y = $Left.position.y
	
	object.contact_monitor = true
	object.max_contacts_reported = 5
	object.connect("body_entered", object.body_collide)
	
	call_deferred("add_child",object)
	
	$AudioStreamPlayer.play()
