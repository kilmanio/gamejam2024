extends Node2D

@export var guys : PackedScene
@onready var spawn_points = [$SpawnLeft, $SpawnRight]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_guy():
	#print("spawning guy")
	var guy = guys.instantiate()
	var random_number = randi_range(0,1)
	if random_number == 0:
		guy.direction = 1
	else:
		guy.direction = -1
	guy.scale = Vector2(0.4, 0.4)
	guy.position = spawn_points[random_number].position
	add_child(guy)


func _on_guy_not_allowed_here_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
	if area.is_in_group("Guy"):
		area.queue_free()


func _on_timer_timeout() -> void:
	spawn_guy()
