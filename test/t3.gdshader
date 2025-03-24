shader_type canvas_item;
uniform float time:hint_range(0.0, 8.0) = 0.0; // 用于控制动画
uniform float scale : hint_range(0.0, 2.0) = 0.1; // 控制飘散幅度

void fragment() {
    vec2 offset = vec2(sin(UV.y * 5.0 + time), cos(UV.x * 5.0 + time));
    vec2 distorted_UV = UV + offset * scale; //offset * scale;
    vec4 texColor = texture(TEXTURE, distorted_UV);
    COLOR = texColor;
}