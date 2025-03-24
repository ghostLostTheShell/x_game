shader_type canvas_item;

uniform float fade_speed : hint_range(0.1, 2.0) = 1.0; // 控制消失速度
uniform float noise_strength : hint_range(0.0, 0.1) = 0.02; // 像素偏移强度

// 伪噪声函数
float noise(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    float noise_value = noise(UV + TIME); // 每个像素的噪声不同
    vec2 offset = vec2(sin(TIME + noise_value * 10.0), cos(TIME + noise_value * 10.0));
    vec2 distorted_UV = UV + offset * noise_strength;

    vec4 texColor = texture(TEXTURE, distorted_UV);

    // 透明度随着时间逐渐减少
    float alpha = 1.0 - smoothstep(0.0, 1.0, TIME * fade_speed + noise_value * 0.5);

    COLOR = vec4(texColor.rgb, texColor.a * alpha);
}
