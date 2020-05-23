shader_type canvas_item;

uniform vec2 target = vec2(0.5);
uniform float intensity: hint_range(0f, 1f);
uniform vec4 color: hint_color;

void fragment(){
	vec2 resolution = 1f / SCREEN_PIXEL_SIZE;
	
	vec2 current_pixel = SCREEN_UV * resolution;
	vec2 target_pixel = vec2(target.x, 1f - target.y) * resolution;
	float dist = distance(current_pixel, target_pixel);
	
	float radius = intensity * length(resolution);
	
	COLOR = color;
	COLOR.a = clamp(1f + dist - radius, 0f, 1f);
}