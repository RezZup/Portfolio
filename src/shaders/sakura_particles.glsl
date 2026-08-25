// Procedural Sakura Blossom Particle Simulation
// Vertex turbulence and fluttering aerodynamics

uniform float uTime;
uniform vec3 uWindVelocity;

attribute vec3 aVelocity;
attribute float aRotationSpeed;
attribute float aPhase;

varying vec2 vUv;
varying float vAlpha;

void main() {
    vUv = uv;
    vec3 pos = position;
    
    // Aerodynamic fluttering motion
    float t = uTime + aPhase;
    pos.x += sin(t * 1.5 + pos.y * 0.2) * 0.4 + uWindVelocity.x * t * 0.1;
    pos.z += cos(t * 1.2 + pos.y * 0.1) * 0.3 + uWindVelocity.z * t * 0.1;
    pos.y = mod(pos.y - uTime * 0.8, 25.0) - 5.0; // Continuous looping drop
    
    vAlpha = smoothstep(-5.0, 0.0, pos.y) * smoothstep(25.0, 20.0, pos.y);
    
    vec4 mvPosition = modelViewMatrix * vec4(pos, 1.0);
    gl_PointSize = (15.0 / -mvPosition.z);
    gl_Position = projectionMatrix * mvPosition;
}
