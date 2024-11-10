extends Node

@export var parents : Array[Node]

func _ready() -> void:
	for parent in parents:
		for button in parent.get_children():
			if button is Button:
				button.connect("mouse_entered", _button_hover.bind(button))
				#button.connect("focus_entered", _button_hover.bind(button))
				button.connect("pressed", _button_pressed.bind(button))

func _button_hover(button:Button):
	#AudioManager.play_audio(load("res://audio/sfx/ui/button_hover2.ogg"), 0.0)
	animate_button(button, 1.2)

func _button_pressed(button:Button):
	#AudioManager.play_audio(load("res://audio/sfx/ui/button_hover.ogg"), 0.0)
	animate_button(button, 1.4)

func animate_button(button:Button, scale:float):
	button.pivot_offset = button.size / 2
	var tween = get_tree().create_tween()
	tween.tween_property(button, "scale", Vector2(scale, scale), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(button, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(tween.kill)
