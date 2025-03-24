shader_type canvas_item;
uniform float time:hint_range(0.0, 360.0) = 0.0;
uniform float fade_speed : hint_range(0.1, 2.0) = 1.0; // 消散速度
uniform float noise_strength : hint_range(0.0, 0.1) = 0.02; // 飘动强度

// 伪噪声函数
float noise(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    // 计算像素偏移
    float noise_value = noise(UV + time);
    vec2 offset = vec2(sin(time + noise_value * 10.0), cos(time + noise_value * 10.0));
    vec2 distorted_UV = UV + offset * noise_strength;

    // 取出变形后的颜色
    vec4 texColor = texture(TEXTURE, distorted_UV);

    // 让像素渐渐透明
    float alpha = 1.0 - smoothstep(0.0, 1.0, time * fade_speed + noise_value * 0.5);

    // 应用颜色和透明度
    COLOR = vec4(texColor.rgb, texColor.a * alpha);
}
