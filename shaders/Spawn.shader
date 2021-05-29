shader_type canvas_item;
render_mode unshaded;

uniform float dispAmt : hint_range(0.0,0.1);
uniform float aberrationAmt : hint_range(0,0.1);
uniform float dispSize : hint_range(0.1, 200.0);

void fragment() {
    // displace effect, alternate rows of dispSize
    float dx;
    if (int(SCREEN_UV.y * dispSize) % 2 == 0) {
        dx = dispAmt;
    } else {
        dx = dispAmt * -1.0;
    }
    vec2 newUV = SCREEN_UV + vec2(dx, 0.0);

    // chromatic aberration
    COLOR.r = texture(SCREEN_TEXTURE, newUV - vec2(aberrationAmt,0.0)).r;
    COLOR.g = texture(SCREEN_TEXTURE, newUV).g;
    COLOR.b = texture(SCREEN_TEXTURE, newUV + vec2(aberrationAmt,0.0)).b;
    COLOR.a = texture(SCREEN_TEXTURE, newUV).a;
	
	COLOR.a *= texture(TEXTURE, UV).a;
	
}    