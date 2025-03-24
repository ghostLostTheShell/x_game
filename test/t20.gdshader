shader_type canvas_item;

// 控制参数
uniform float speed = 2.0;      // 飘动速度（频率）
uniform float amplitude = 0.02; // 飘动幅度（最大位移比例）

void fragment() {
    // 基础UV
    vec2 base_uv = UV;
    
    // 生成水平位移：sin(时间*速度) * 幅度
    float horizontal_offset = sin(TIME * speed) * amplitude;
    
    // 应用UV偏移（仅X轴）
    vec2 distorted_uv = vec2(base_uv.x + horizontal_offset, base_uv.y);
    
    // 采样偏移后的颜色（需确保纹理重复模式启用）
    vec4 color = texture(TEXTURE, distorted_uv);
    COLOR = color;
}