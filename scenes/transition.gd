extends Control

@onready var triangle = $CanvasLayer/CenterContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func transition_in(enter_transition_function:Callable=empty, exit_transition_function:Callable=empty):
	triangle.pivot_offset = triangle.size / 2
	var tween = get_tree().create_tween()
	tween.tween_property(triangle, "scale", Vector2(100, 100), 0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(enter_transition_function)
	tween.tween_callback(transition_out.bind(exit_transition_function))
	tween.tween_callback(tween.kill)

func transition_out(exit_transition_function:Callable=empty):
	triangle.pivot_offset = triangle.size / 2
	var tween = get_tree().create_tween()
	tween.tween_property(triangle, "scale", Vector2(0, 0), 0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(exit_transition_function)
	tween.tween_callback(tween.kill)

func empty():
	print("No callable in transition")

func transition_audio():
	#load audio here and play it on transition in
	AudioManager.play_audio(load("res://placeholder.mp3"))
