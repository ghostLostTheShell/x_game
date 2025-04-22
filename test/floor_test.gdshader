shader_type canvas_item;

uniform float width : hint_range(0.0, 1.0);  // 纹理宽度（从 0 到 1）
uniform float transparency_width = 0.2; // 透明区域的宽度，比例

void fragment() {
    // 获取当前像素的 UV 坐标
    float xPos = UV.x;

	//vec2 center = vec2(0.5);


    // 计算透明区域的起始和结束位置
    float start = (0.5 - transparency_width / 2.0);  // 中间区域的左边界
    float end = (0.5 + transparency_width / 2.0);    // 中间区域的右边界

    // 如果当前像素的横坐标在透明区域内，设置透明度为 0
    if (xPos >= start && xPos <= end) {
        COLOR = vec4(0.0, 0.0, 0.0, 0.0); // 透明
    } else {
        // 否则显示正常的纹理颜色
        vec4 texColor = texture(TEXTURE, UV);
        COLOR = texColor;
    }
}
