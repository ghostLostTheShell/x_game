//shader_type canvas_item;
//
//uniform float sigma : hint_range(0.1, 10.0) = 3.0; // 控制模糊程度
//
//void fragment() {
    //vec4 sum = vec4(0.0);
    //vec2 tex_offset = SCREEN_PIXEL_SIZE; // 每个像素的大小
    //float total_weight = 0.0;
//
    //// 5x5 高斯核
    //for (int x = -2; x <= 2; x++) {
        //for (int y = -2; y <= 2; y++) {
			//float _x = float(x);
			//float _y = float(y);
            //float weight = exp(-0.5 * (_x*_x + _y*_y) / (sigma * sigma));
            //sum += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(_x, _y) * tex_offset) * weight;
            //total_weight += weight;
        //}
    //}
//
    //COLOR = sum / total_weight; // 归一化
//}