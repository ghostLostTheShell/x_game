shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}
//#define eq_color vec4(217, 110, 166, 1)/255.
//#define rq_color vec4(255.0, 194.0, 13.0, 1.0)/255.0

void fragment() {
	vec4 rq_color = vec4(255.0/255.0, 194.0/255.0, 13.0/255.0, 1.0);
	vec4 eq_color = vec4(217.0/255.0, 110.0/255.0, 166.0/255.0, 1.0);
	vec4 color = texture(TEXTURE, UV);
	if(distance(color, eq_color) < 0.1){
		COLOR=rq_color;
	}else{
		COLOR=color;
	}
	//COLOR=eq_color;
}


