#extends CharacterBody2D
extends RigidBody2D

const SPEED = 600
var active = true

func _ready() -> void:
	#contact_monitor = true
	#max_contacts_reported = 8
	set_continuous_collision_detection_mode(0)

func _physics_process(delta: float) -> void:
	pass
