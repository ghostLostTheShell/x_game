shader_type canvas_item;

// 控制参数
uniform float progress : hint_range(0.0, 1.0) = 0.0; // 0=完全可见, 1=全黑
uniform vec2 scale = vec2(1.5, 0.8);   // 椭圆缩放系数 (X/Y轴比例)
uniform float smoothness : hint_range(0.0, 0.5) = 0.1; // 边缘平滑度

void fragment() {
    // 获取原始颜色
    vec4 original_color = texture(TEXTURE, UV);
    
    // 椭圆距离计算
    vec2 center = vec2(0.5);
    vec2 scaled_UV = (UV - center) * scale + center;
    float dist = distance(scaled_UV, center);
    
    // 动态过渡控制
    float threshold = mix(1.414, 0.0, progress); // 1.414≈√2 保证全覆盖
    float alpha = smoothstep(
        threshold + smoothness, 
        threshold - smoothness, 
        dist
    );
	
    alpha = 1.0 - alpha;
    // 混合颜色
    COLOR = mix(original_color, vec4(0.0, 0.0, 0.0, 1.0), alpha);
}