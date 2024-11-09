#extends CharacterBody2D
extends RigidBody2D

const SPEED = 600
var active = true

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 1
	set_continuous_collision_detection_mode(2)

func handle_movement():
	match [Input.is_action_pressed("ui_left"), Input.is_action_pressed("ui_right")]:
		[true, false]: apply_force(Vector2(-SPEED, 0))
		[false, true]: apply_force(Vector2(SPEED, 0))

func _physics_process(delta: float) -> void:
	if active:
		handle_movement()


func _on_body_shape_entered(_body_rid: RID, _body: Node, _body_shape_index: int, _local_shape_index: int) -> void:
	active = false
	set_continuous_collision_detection_mode(0)
