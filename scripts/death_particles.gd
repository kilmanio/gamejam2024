extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_blood()

func fade_blood():
	var tween = get_tree().create_tween()
	tween.tween_property($Nose, "modulate", Color(1, 0, 0.239, 0), 5)
	tween.tween_callback(queue_free)
