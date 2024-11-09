extends RigidBody2D

@export var color1 : Color
@export var color2 : Color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	$Sprite2D.material = load("res://shaders/block_shader.tres").duplicate()
	#var new_mat = ShaderMaterial.new()
	#new_mat.shader = load("res://shaders/tractor_beam_item.gdshader")
	#$Sprite2D.material = new_mat


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func block_tractored(value):
	#$Sprite2D.material.set("shader_parameter/speed", 1)
	$Sprite2D.material.set("shader_parameter/is_tractored", value)
