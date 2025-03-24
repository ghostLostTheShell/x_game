shader_type canvas_item;

void fragment() {
    // 获取纹理颜色
    vec4 color = texture(TEXTURE, UV);
    
    // 计算纹理的实际尺寸
    vec2 tex_size = 1.0 / TEXTURE_PIXEL_SIZE;
    
    // 将UV转换为像素坐标
    vec2 pixel_pos = UV * tex_size;
    
    // 计算纹理中心坐标
    vec2 center = tex_size * 0.5;
    
    // 判断当前像素是否在中心50x50范围内
    if (abs(pixel_pos.x - center.x) < 25.0 && abs(pixel_pos.y - center.y) < 25.0) {
        color.a = 0.0; // 设置透明
    }
    
    COLOR = color;
}