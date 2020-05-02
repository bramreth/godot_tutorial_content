shader_type canvas_item;

uniform float offset = 1f;

void fragment(){
	vec4 green_channel = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 red_channel = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x + (offset * SCREEN_PIXEL_SIZE.x), SCREEN_UV.y));
	vec4 blue_channel = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x - (offset * SCREEN_PIXEL_SIZE.x), SCREEN_UV.y));
	COLOR = vec4(red_channel.r, green_channel.g, blue_channel.b, 1f);
}