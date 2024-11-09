extends RigidBody2D
const SHIP_SPEED = 500
var beam = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$PlayerGFX/TractorBeam.visible = false
	$Beam.gravity_space_override = false
	lock_rotation = true
	contact_monitor = true
	max_contacts_reported = 1
	set_linear_damp(1)
	set_continuous_collision_detection_mode(2)
	set_gravity_scale(0)

func handle_movement():
	match [Input.is_action_pressed("ui_left"), Input.is_action_pressed("ui_right")]:
		[true, false]: 
			apply_force(Vector2(-SHIP_SPEED, 0))
			$PlayerGFX.change_state($PlayerGFX.state.LEFT)
		
		[false, true]: 
			apply_force(Vector2(SHIP_SPEED, 0))
			$PlayerGFX.change_state($PlayerGFX.state.RIGHT)
	
	match [Input.is_action_pressed("ui_down"), Input.is_action_pressed("ui_up")]:
		[true, false]: apply_force(Vector2(0, SHIP_SPEED))
		[false, true]: apply_force(Vector2(0, -SHIP_SPEED))

func handle_beam():
	if Input.is_action_pressed("ui_select"):
		$Beam.gravity_space_override = true
		beam = true
	else:
		
		$Beam.gravity_space_override = false
		beam = false
	
	if Input.is_action_just_pressed("ui_select"):
		$PlayerGFX.tractor()
	if Input.is_action_just_released("ui_select"):
		$PlayerGFX.detractor()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	handle_movement()
	handle_beam()
