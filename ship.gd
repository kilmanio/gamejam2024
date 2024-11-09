extends RigidBody2D
const SHIP_SPEED = 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lock_rotation = true
	contact_monitor = true
	max_contacts_reported = 1
	set_continuous_collision_detection_mode(2)
	set_gravity_scale(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match [Input.is_action_pressed("ui_left"), Input.is_action_pressed("ui_right")]:
		[true, false]: apply_force(Vector2(-SHIP_SPEED, 0))
		[false, true]: apply_force(Vector2(SHIP_SPEED, 0))
	
	match [Input.is_action_pressed("ui_down"), Input.is_action_pressed("ui_up")]:
		[true, false]: apply_force(Vector2(0, SHIP_SPEED))
		[false, true]: apply_force(Vector2(0, -SHIP_SPEED))
