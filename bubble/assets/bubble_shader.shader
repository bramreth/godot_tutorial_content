shader_type canvas_item;

uniform bool on = false;
uniform float speed = 5f;
uniform float magnitude = 15f;

void vertex(){
	if(on){
		if(VERTEX.x > 0.5){
			VERTEX.x += ( abs(sin(TIME*speed)) * magnitude) - (magnitude/2f);
		}
		if(VERTEX.x < 0.5){
			VERTEX.x -= ( abs(sin(TIME*speed)) * magnitude) - (magnitude/2f);
		}
		if(VERTEX.y > 0.5){
			VERTEX.y += ( abs(sin(TIME*speed)) * magnitude) - (magnitude/2f);
		}
		if(VERTEX.y < 0.5){
			VERTEX.y -= ( abs(sin(TIME*speed)) * magnitude) - (magnitude/2f);
		}
	}
}