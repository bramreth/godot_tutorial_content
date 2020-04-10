shader_type canvas_item;

uniform bool on = false;
uniform float speed = 5f;
uniform float magnitude = 15f;

void vertex(){
	if(on){
		VERTEX += VERTEX *  ( abs(sin(TIME*speed)) * magnitude) - (magnitude/2f);
		
	}
}