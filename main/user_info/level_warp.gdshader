shader_type canvas_item;

uniform vec2 center = vec2(0.5, 0.5); // 旋转中心
uniform float speed = 1.0; // 旋转速度，可调节

void fragment() {
    vec2 uv = UV; // 当前像素的UV坐标

    // 将UV坐标偏移到以中心为原点
    vec2 offset = uv - center;

    // 根据TIME动态生成旋转角度
    float rotation_angle = TIME * speed;

    // 计算旋转矩阵
    float cos_angle = cos(rotation_angle);
    float sin_angle = sin(rotation_angle);
    mat2 rotation_matrix = mat2(
        vec2(cos_angle, -sin_angle),
        vec2(sin_angle,  cos_angle)
    );

    // 应用旋转矩阵
    vec2 rotated_uv = rotation_matrix * offset;

    // 将UV坐标移回原始范围
    rotated_uv += center;

    // 采样纹理
    COLOR = texture(TEXTURE, rotated_uv);
}
