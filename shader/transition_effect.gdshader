shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0; // 进度控制 (0=黑屏, 1=完全可见)
uniform vec2 scale = vec2(0.5, 0.3); // 控制横向和纵向的拉伸 (Y 方向缩小)

void fragment() {
    vec4 color = texture(TEXTURE, UV);

		// 计算扁圆形的距离 (缩放 UV 坐标)
    	vec2 center = vec2(0.5);
    	vec2 scaled_UV = (UV - center) / scale + center;
    	float dist = distance(scaled_UV, center);
    	// 控制亮度过渡
    	float alpha = smoothstep(progress-0.3, progress+1.0, dist * (1.0-progress));

    	COLOR = vec4(0.0, 0.0, 0.0, alpha);

}