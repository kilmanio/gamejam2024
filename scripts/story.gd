extends Control

@export var anim_player : AnimationPlayer
var skipped = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	self.visible = true
	await get_tree().create_timer(0.5).timeout
	play_story()


func play_story():
	if !skipped:
		var tween = get_tree().create_tween()
		tween.tween_property($CenterContainer/Label, "visible_ratio", 1, 2)
		tween.tween_callback(play_animation)
		tween.tween_callback(tween.kill)
	else:
		return

func play_animation():
	anim_player.play("shooting_star")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if !skipped:
		await get_tree().create_timer(0.5).timeout
		Transition.transition_in(hide_story, MusicManager.play_music)
	else:
		return

func hide_story():
	self.visible = false


func _on_button_skip_pressed() -> void:
	skipped = true
	Transition.transition_in(hide_story, MusicManager.play_music)
