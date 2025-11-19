shader_type spatial;
render_mode blend_mix, unshaded;

uniform vec3 color : source_color = vec3(1.0, 1.0, 1.0);
uniform float edge_softness : hint_range(0.0, 10.0) = 4.0;

void fragment() {
    vec3 view_dir = normalize(-VIEW);
    float fresnel = pow(1.0 - dot(view_dir, NORMAL), edge_softness);

    // Fresnel is high at edges, low in the center
    ALBEDO = color;
    ALPHA = 1.0 - fresnel; // fade edges
}