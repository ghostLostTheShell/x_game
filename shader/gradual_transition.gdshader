shader_type canvas_item;

uniform float red_progress : hint_range(0.0, 1.0) = 0.0;
uniform float blue_progress : hint_range(0.0, 1.0) = 0.0; 
uniform vec3 light_red = vec3(1.0, 0.0, 0.0);
uniform vec3 light_blue = vec3(0.0, 0.0, 1.0);

void fragment() {
    // 计算从底部到顶部的透明度变化
    //float alpha = smoothstep(progress - 0.2, progress + 0.8, UV.y * (1.0 - progress));
	float red_alpha = smoothstep(red_progress - 0.2, red_progress + 0.8, (1.0 - UV.y) * (0.9 - red_progress));
    float bule_alpha = smoothstep(blue_progress - 0.2, blue_progress + 0.8, (1.0 - UV.y) * (0.9 - blue_progress));
    // 计算最终颜色：使用 mix() 混合红色和蓝色1
    vec3 mixed_color = mix(light_red, light_blue, bule_alpha);
    float final_alpha = max(red_alpha, bule_alpha); // 取两个颜色的最大透明度，避免完全透明
    
	COLOR = vec4(mixed_color, final_alpha);
}
