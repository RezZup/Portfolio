// High-speed rain streak procedural renderer
uniform float uTime;
varying float vIntensity;

void main() {
    // Elongated screen-space droplet streak
    vec2 coord = gl_PointCoord - vec2(0.5);
    if (abs(coord.x) > 0.08 || abs(coord.y) > 0.48) {
        discard;
    }
    float alpha = (1.0 - abs(coord.y) * 2.0) * 0.4;
    gl_FragColor = vec4(0.85, 0.90, 1.0, alpha);
}
