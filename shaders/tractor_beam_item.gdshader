shader_type canvas_item;

uniform vec4 base_color : source_color;
uniform vec4 color_one : source_color;
uniform vec4 color_two : source_color;
uniform sampler2D mask_texture : repeat_enable;
uniform float speed = 1.0;

uniform sampler2D dissolve_texture : source_color;
uniform float dissolve_value : hint_range(0,1);

uniform bool is_tractored = false;

void vertex() {
	// Called for every vertex the material is visible on.
	//VERTEX += vec2(0, sin(TIME*100.0)*speed);
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 move = vec2(0,1) * TIME * speed;
	COLOR = texture(TEXTURE, UV);
	vec3 col2 = texture(TEXTURE, UV).rgb * color_two.rgb;
	float alpha = texture(mask_texture, UV + move).r;
	vec3 color = texture(TEXTURE, UV).rgb * color_one.rgb;
	vec3 m = mix(col2, color, alpha);
	COLOR.rgb = m;
	COLOR.a = color_two.a;
	
	vec4 dissolve = texture(mask_texture, UV);
	vec4 main = texture(TEXTURE, UV);
	COLOR.a = main.a;
	if (is_tractored == false)
	{
		COLOR.rgb = texture(TEXTURE, UV).rgb * base_color.rgb;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
