extends Area2D

var speed = 10

@export var direction = 1

@export var particles : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	move(delta)

func move(delta):
	position += Vector2(direction, 0) * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Block"):
		if body.linear_velocity.x <= 1 && body.linear_velocity.y <= 1:
			print("Block in the way of Egyptian!")
			direction *= -1
		else:
			print("Egyptian been hit!")
			death()

func death():
	var death_particle = particles.instantiate()
	death_particle.position = position
	death_particle.emitting = true
	get_parent().add_child(death_particle)
	queue_free()
