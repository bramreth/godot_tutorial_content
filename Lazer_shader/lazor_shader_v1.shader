shader_type canvas_item;

uniform float intensity = 0.5f;
uniform float layers = 5f;
uniform float speed = 4f;

float gradient(vec2 uv){
    
//    return (0.5f - distance(vec2(0f, uv.y), vec2(0f, 0.5f))); // gradient top to bottom, focus in middle
//    return (1f - distance(vec2(0f, uv.y), vec2(0f, 0f))); // gradient top
//    return (1f - distance(vec2(0f, uv.y), vec2(0f, 1f))); // gradient bottom
    return (0.5f - distance(vec2(uv.x, uv.y), vec2(0.5f, 0.5f))); //gradient circle
}

vec4 colorize(float c, float a){
    vec4 pallete;
    pallete = vec4(c,c,c,a);
    pallete.r = float(c >= 1f);
    return pallete;
}

void fragment(){
    // noise
    vec4 bg = texture(TEXTURE, UV - TIME / speed);
    
    COLOR.r = gradient(UV);
    // make noise more intense, apply and clamp
    COLOR.r = clamp(COLOR.r * bg.r * intensity * 10f, 0f, 1f);
    // seperate the noise into layers by removing decimal precision
    COLOR.r = floor(COLOR.r * layers) / layers;
    // make the bottom layer transparent
    COLOR.a = float(COLOR.r > 0f);
    // apply a color pallete
    COLOR = colorize(COLOR.r, COLOR.a);
}