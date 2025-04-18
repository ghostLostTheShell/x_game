shader_type canvas_item;

uniform vec4 shadow_color : source_color = vec4(0.0, 0.0, 0.0, 0.5); // 阴影颜色
uniform float border_width : hint_range(0.0, 10.0) = 5.0; // 边框宽度

void fragment() {
    vec2 uv = UV;
    vec4 base_color = texture(TEXTURE, uv);
    float distance_to_edge = min(uv.x, min(uv.y, min(1.0 - uv.x, 1.0 - uv.y)));
    float shadow_intensity = smoothstep(border_width / 100.0, 0.0, distance_to_edge);
    vec4 shadow = shadow_color * shadow_intensity;
    COLOR = mix(base_color, shadow, shadow.a);
}
