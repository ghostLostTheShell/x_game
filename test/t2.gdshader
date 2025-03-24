shader_type canvas_item;

#define iResolution 1.0/SCREEN_PIXEL_SIZE
#define iTime TIME
#define fragColor COLOR

#define bg_color vec3(255, 194, 212)/255.

float stroke(float x, float s, float w){

    float temp = ((x+w*.5) - (x-w*.5)) *0.5;
    float d = smoothstep(temp+0.015, temp,abs(s - ((x+w*.5) -temp)));

    return clamp(d, 0.0, 1.0);
}

// 2D rotation function
mat2 rot2D(float a) {
    return mat2(vec2(cos(a), -sin(a)), vec2(sin(a), cos(a)));
}

//https://iquilezles.org/articles/distfunctions2d/
float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}

float dot2(in vec2 v ) { return dot(v,v); }

float sdTrapezoid( in vec2 p, in float r1, float r2, float he )
{
    vec2 k1 = vec2(r2,he);
    vec2 k2 = vec2(r2-r1,2.0*he);
    p.x = abs(p.x);
    vec2 ca = vec2(p.x-min(p.x,(p.y<0.0)?r1:r2), abs(p.y)-he);
    vec2 cb = p - k1 + k2*clamp( dot(k1-p,k2)/dot2(k2), 0.0, 1.0 );
    float s = (cb.x<0.0 && ca.y<0.0) ? -1.0 : 1.0;
    return s*sqrt( min(dot2(ca),dot2(cb)) );
}

float sdCircle( vec2 p, float r )
{
    return length(p) - r;
}


void fragment()
{
    vec2 uv_base = (SCREEN_UV - 0.5) * 2.0 * vec2(SCREEN_PIXEL_SIZE.y / SCREEN_PIXEL_SIZE.x, 1.0);
	uv_base.y *= -1.;
    vec2 uv = uv_base*0.7;
    uv.y +=0.05;
    uv *= rot2D(sin(iTime*1.2+0.4)*0.3);

    vec3 col = vec3(0.);

    // background
    vec3 bg = bg_color;

    //cup
    vec2 uv_cup = uv*2.7;
    float cup = sdTrapezoid(uv_cup, 0.26, 0.46, 0.7);
    float cup_edge = stroke(cup, 0.12,0.04);
    float cup_bg = smoothstep(0.02,0.01,cup);
    //top
    vec2 uv_topcup = uv*2.7;
    uv_topcup = vec2(uv_topcup.x*0.34, uv_topcup.y);
    float top_cup = sdCircle(uv_topcup - vec2(0.,0.75), 0.095);
    float top_cup_bg = smoothstep(0.045,0.035,top_cup);
    float hide_top_cup_bg = smoothstep(0.09,0.07,top_cup);
    float topcup_edge = stroke(top_cup, 0.09,0.02);

    //straw
    vec2 uv_straw = uv * 3.;
    //---still---
    //uv_straw *= rot2D(-0.18);
    //---animated---
    uv_straw *= rot2D(sin(iTime*1.2 + -0.18)*0.35);
    float straw = sdBox(uv_straw-vec2(0.0,0.3), vec2(0.01,1.));
    straw = smoothstep(0.08,0.05, straw);

    //milk brown sugar
    vec2 uv_front = (uv_base*0.75) * 50.;
    uv_front = vec2(uv_front.x + iTime*5., uv_front.y-0.8);
    float front = uv_front.y + sin(uv_front.x*0.35)*1.5;
    front = smoothstep(0.1,0.7, front);
    front = 1.-front;
    front *= smoothstep(0.07,0.04,cup);
    front = clamp(front, .0,1.0);

    vec2 uv_back = (uv_base*0.75) * 50.;
    uv_back = vec2(9.5+uv_back.x - iTime*5., uv_back.y-1.2);
    float back = uv_back.y + sin(uv_back.x*0.35)*1.5;
    back = smoothstep(0.1,0.7, back);
    back = 1.-back;
    back *= smoothstep(0.05,0.04,cup);
    back = clamp(back, .0,1.0);
    //gradient brown sugar
    //++ add noise in sugar
    vec3 milk_brown_sugar= mix(vec3(0.5,.1,0.0), vec3(0.9,.9,.9), 1.2*uv.y+1.);

    //tapioca
    vec2 uv_ball = uv * 20.;
    float b1 = smoothstep(0.35,0.2, sdCircle(uv_ball- vec2(0.1,sin(iTime*1.2)*0.3-2.8), 0.2)); //y
    float b2 = smoothstep(0.35,0.2, sdCircle(uv_ball- vec2(sin(0.2+iTime*1.2)*0.4+0.5,-4.3), 0.19)); //x
    float b3 = smoothstep(0.35,0.2, sdCircle(uv_ball- vec2(-1.2,sin(0.8+iTime*1.2)*0.5-4.2), 0.2)); //y
    float b4 = smoothstep(0.35,0.2, sdCircle(uv_ball- vec2(1.8+sin(2.32+iTime*1.2)*0.2,-2.4), 0.22)); //x
    float b5 = smoothstep(0.35,0.2, sdCircle(uv_ball- vec2(1.6+sin(0.67+iTime*1.2)*0.31,-3.7), 0.19)); //x
    float b6 = smoothstep(0.35,0.2, sdCircle(uv_ball- vec2(-1.75,sin(0.1+iTime)*0.6-2.4), 0.19)); //y

    float tapioca = max(b1,b2);
    tapioca = max(tapioca,b3);
    tapioca = max(tapioca,b4);
    tapioca = max(tapioca,b5);
    tapioca = max(tapioca,b6);

    //colo
    col = mix(bg, bg_color*0.9, cup_bg);
    col = mix(col, vec3(1.0), cup_edge);

    col = mix(col, bg_color, hide_top_cup_bg);
    col = mix(col, bg_color*0.9, top_cup_bg);
    col = mix(col, vec3(1.0), topcup_edge);

    col = mix(col, milk_brown_sugar*0.9, back);
    col = mix(col, vec3(1.0), straw);
    col = mix(col, milk_brown_sugar, front);

    col = mix(col, vec3(82, 46, 56)/255., tapioca);


    //col = vec3(tapioca);
    //col = vec3(milk_brown_sugar);



    // Output to screen
    fragColor = vec4(col,1.0);
}