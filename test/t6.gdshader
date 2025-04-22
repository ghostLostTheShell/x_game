shader_type canvas_item;

// 控制参数
uniform float progress : hint_range(0.0, 1.0) = 0.0; // 消散进度
uniform float pixel_size : hint_range(1, 356) = 8.0;  // 像素块大小
uniform float drift_strength : hint_range(0.0, 2.0) = 0.5; // 飘动强度
uniform vec2 direction = vec2(1.0, -0.5); // 飘动主方向
uniform sampler2D noise_tex; // 噪声纹理

void fragment() {
    // 像素化处理
    vec2 pixelated_uv = floor(UV * pixel_size) / pixel_size;
    vec4 color = texture(TEXTURE, pixelated_uv);

    // 生成随机飘动偏移
    vec2 noise = texture(noise_tex, pixelated_uv * 2.0).rg;
    vec2 drift_offset = mix(
        direction,
        noise * 2.0 - 1.0, // [-1,1]随机方向
        drift_strength
    ) * progress * 0.2;

    // 消散效果计算
    float fade = smoothstep(0.8, 1.0, progress);
    float alpha = 1.0 - smoothstep(
        0.0,
        0.5,
        length(drift_offset) + fade
    );

    // 最终混合输出
    COLOR = texture(TEXTURE, pixelated_uv - drift_offset);
    COLOR.a *= alpha * (1.0 - progress);
}