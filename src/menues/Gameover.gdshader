shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 cyan = vec4(0,1,1,1);
	vec4 magenta = vec4(1,0,1,1);
	float y = UV.y * 0.8;
	
	COLOR = cyan*(1.0 - y) + magenta*y;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
