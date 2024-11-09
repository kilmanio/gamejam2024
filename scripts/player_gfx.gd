extends Node2D

var rotation_value = 0
var movement_value = 0

enum state {IDLE, RIGHT, LEFT}

func _ready() -> void:
	shader_param(0.0)

func _process(_delta: float) -> void:
	lerp_rotation()

func change_state(alien_state):
	match alien_state:
		state.IDLE:
			$Alien.play("idle")
			rotation_value = 0
		state.RIGHT:
			$Alien.play("turn_right")
			$Alien.flip_h = false
			rotation_value = 25
		state.LEFT:
			$Alien.play("turn_right")
			$Alien.flip_h = true
			rotation_value = -35

func tractor():
	$AnimationPlayer.play("tractor_bounce")
	var tween = get_tree().create_tween()
	tween.tween_method(shader_param, 0.0, 1.0, 0.2).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(tween.kill)

func detractor():
	var tween = get_tree().create_tween()
	tween.tween_method(shader_param, 1.0, 0, 0.1)
	tween.tween_callback(tween.kill)

func shader_param(value:float):
	$TractorBeam.material.set("shader_parameter/dissolve_value", value)

func lerp_rotation():
	#change_state()
	rotation = lerp_angle(rotation, deg_to_rad(rotation_value), 0.1)
