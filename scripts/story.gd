extends Control

@export var anim_player : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	play_story()


func play_story():
	var tween = get_tree().create_tween()
	tween.tween_property($CenterContainer/Label, "visible_ratio", 1, 2)
	tween.tween_callback(play_animation)

func play_animation():
	anim_player.play("shooting_star")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
	await get_tree().create_timer(0.5).timeout
	self.visible = false
