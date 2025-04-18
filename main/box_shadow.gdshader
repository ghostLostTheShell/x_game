shader_type canvas_item;


//uniform float border_width : hint_range(0.0, 10.0) = 5.0; // 边框宽度


uniform vec4 shadow_color : source_color = vec4(0.0, 0.0, 0.0, 0.5); // 阴影颜色
uniform float shadow_offset :hint_range(0.0, 10.0) = 5.0; // 边框宽度

void fragment() {
    vec2 shadow_uv = UV + shadow_offset / vec2(textureSize(TEXTURE, 0));
    vec4 shadow = texture(TEXTURE, shadow_uv) * shadow_color;
    vec4 base = texture(TEXTURE, UV);
    COLOR = mix(shadow, base, base.a);
}
