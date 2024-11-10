extends Control


func _on_button_start_pressed() -> void:
	pass # Replace with function body.
	Transition.transition_in(go_to_level)

func go_to_level():
	get_tree().change_scene_to_file("res://scenes/gametest.tscn")
