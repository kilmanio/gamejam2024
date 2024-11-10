extends Control


func _ready() -> void:
	change_volume("Master", %HSlider.value)

func _on_button_start_pressed() -> void:
	pass # Replace with function body.
	Transition.transition_in(go_to_level)

func go_to_level():
	get_tree().change_scene_to_file("res://scenes/gametest.tscn")

func change_volume(bus:String, value:float):
	var bus_index = AudioServer.get_bus_index(bus)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_h_slider_value_changed(value: float) -> void:
	pass # Replace with function body.
	change_volume("Master", value)
