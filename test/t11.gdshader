shader_type canvas_item;

// 控制参数
uniform float progress : hint_range(0, 1) = 0.0;  // 整体进度（0=开始，1=完全消失）
uniform float shake_frequency = 5.0;              // 晃动频率
uniform float shake_amplitude = 0.02;             // 晃动幅度
uniform float float_speed = 0.5;                  // 上飘速度
uniform sampler2D noise_tex;                      // 噪声纹理（需导入）

void fragment() {
    // 原始颜色采样
    vec4 color = texture(TEXTURE, UV);
    
    // ===== 1. 计算中心遮罩 =====
    vec2 center = vec2(0.5, 0.5);
    float distance_to_center = length(UV - center);
    // 径向遮罩：中心向外扩散（progress=1时完全透明）
    float center_mask = smoothstep(progress - 0.2, progress + 0.2, distance_to_center);
    
    // ===== 2. 像素随机水平晃动 =====
    // 基于噪声生成随机相位（每个像素不同）
    float noise = texture(noise_tex, UV * 10.0 + TIME * 0.1).r; 
    float horizontal_offset = sin(TIME * shake_frequency + noise * 6.283) * shake_amplitude;
    
    // ===== 3. 向上飘动 =====
    // 飘动速度与遮罩关联：越外围的像素飘得越快
    float vertical_offset = (1.0 - center_mask) * TIME * float_speed;
    
    // ===== 4. 综合位移 =====
    vec2 distorted_uv = UV + vec2(horizontal_offset, -vertical_offset);
    
    // ===== 5. 重新采样位移后的颜色 =====
    // 注意：需启用纹理重复模式（TEXTURE_FLAG_REPEAT）
    vec4 distorted_color = texture(TEXTURE, distorted_uv);
    
    // ===== 6. 最终透明度混合 =====
    // 根据遮罩和飘动距离淡出
    float fade = 1.0 - clamp(vertical_offset * 2.0, 0.0, 1.0);
    distorted_color.a *= fade * (1.0 - center_mask);
    
    COLOR = mix(color, distorted_color, 1.0 - center_mask);
}