shader_type canvas_item;

uniform bool apply = true;
uniform float amount = 1.0;

void fragment() {
	vec4 texture_color = texture(SCREEN_TEXTURE, UV);
	vec4 color = texture_color;
	
	if (apply == true) {
		float adjusted_amount = amount * texture(SCREEN_TEXTURE, UV).r / 100.0;
		color.r = texture(SCREEN_TEXTURE, vec2(UV.x + adjusted_amount, UV.y)).r;
		color.g = texture(SCREEN_TEXTURE, UV).g;
		color.b = texture(SCREEN_TEXTURE, vec2(UV.x - adjusted_amount, UV.y)).b;
	}
	COLOR = color;
}