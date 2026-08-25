// Volumetric Mountain Fog Fragment Shader
// Raymarched height-decay exponential fog

uniform vec3 uFogColor;
uniform float uFogDensity;
uniform float uFogHeightFalloff;
uniform float uTime;

varying vec3 vWorldPosition;
varying vec3 vCameraToWorld;

float getFogFactor(vec3 worldPos, vec3 cameraPos) {
    vec3 rayDir = normalize(worldPos - cameraPos);
    float rayLength = length(worldPos - cameraPos);
    
    // Exponential height falloff
    float heightFactor = exp(-cameraPos.y * uFogHeightFalloff);
    float integral = heightFactor * (1.0 - exp(-rayLength * rayDir.y * uFogHeightFalloff)) / max(rayDir.y * uFogHeightFalloff, 0.0001);
    
    return clamp(1.0 - exp(-uFogDensity * integral), 0.0, 1.0);
}

void main() {
    float fog = getFogFactor(vWorldPosition, cameraPosition);
    gl_FragColor = vec4(uFogColor, fog * 0.85);
}
