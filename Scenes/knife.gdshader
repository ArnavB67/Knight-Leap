shader_type canvas_item;
uniform vec4 GlowColor : source_color = vec4(0.0, 1.0, 1.0, 1.0);
uniform float GlowSize = 1.0;
uniform float GlowIntensity = 4.0;
uniform float PulseSpeed = 3.0;
void fragment(){
    vec2 Size = GlowSize / vec2(textureSize(TEXTURE, 0));
    vec4 Color = texture(TEXTURE, UV);
    float Pulse = sin(TIME * PulseSpeed) * 0.2 + 0.8;
    float InnerAlpha = 0.0;
    float OuterAlpha = 0.0;
    for(float x = -1.0; x <= 1.0; x++){
        for(float y = -1.0; y <= 1.0; y++){
            InnerAlpha += texture(TEXTURE, UV + vec2(x, y) * Size).a;
        }
    }
    for(float x = -2.0; x <= 2.0; x++){
        for(float y = -2.0; y <= 2.0; y++){
            OuterAlpha += texture(TEXTURE, UV + vec2(x, y) * Size).a;
        }
    }
    InnerAlpha = clamp(InnerAlpha, 0.0, 1.0);
    float FallOff = clamp(OuterAlpha / 25.0, 0.0, 1.0);
    FallOff = pow(FallOff, 3.0);
    if(Color.a > 0.0){
        COLOR = Color;
    } else if(InnerAlpha > 0.0){
        COLOR = vec4(GlowColor.rgb * GlowIntensity * Pulse, 1.0);
    } else if(FallOff > 0.0){
        COLOR = vec4(GlowColor.rgb, FallOff * Pulse);
    }
}