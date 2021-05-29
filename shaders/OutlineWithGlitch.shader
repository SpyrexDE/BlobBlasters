shader_type canvas_item;
uniform float aura_width = 0.0;
uniform float glitch_amount = 1.0;
uniform vec4 aura_color: hint_color;

void fragment(){
    vec4 col = texture(TEXTURE, UV);
    vec2 ps = TEXTURE_PIXEL_SIZE * aura_width;
    float a;
    float maxa = col.a;
    float mina = col.a;


	//GLITCH COLORS
		vec4 color = texture(TEXTURE, UV);
		float adjusted_amount = glitch_amount * texture(TEXTURE, UV).r / 100.0;
		col.r = texture(TEXTURE, vec2(UV.x + adjusted_amount, UV.y + adjusted_amount)).r;
		col.g = texture(TEXTURE, vec2(UV.x - adjusted_amount, UV.y + adjusted_amount)).g;
		col.b = texture(TEXTURE, vec2(UV.x - adjusted_amount, UV.y + adjusted_amount)).b;
		col.a = texture(TEXTURE, vec2(UV.x + 2.0 * adjusted_amount, UV.y + adjusted_amount)).a;



    for(float x = -1.0; x <= 1.0; x+=0.05) {
        float y = 1.0 - (x*x);
        if(vec2(x,y) == vec2(0.0)) {
            continue; // ignore the center of kernel
        }

        a = texture(TEXTURE, UV + vec2(x,y)*ps).a;
        maxa = max(a, maxa); 
        mina = min(a, mina);
    }

    for(float x = -1.0; x <= 1.0; x+=0.05) {
        float y = -1.0 + (x*x);
        if(vec2(x,y) == vec2(0.0)) {
            continue; // ignore the center of kernel
        }

        a = texture(TEXTURE, UV + vec2(x,y)*ps).a;
        maxa = max(a, maxa); 
        mina = min(a, mina);
    }



    // Fill transparent pixels only, don't overlap texture
    if(col.a < 0.5) {
        COLOR = mix(col, aura_color, maxa-mina);
    } else {
        COLOR = col;
    }
}