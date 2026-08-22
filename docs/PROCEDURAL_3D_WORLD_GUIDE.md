# Yokoso Procedural 3D World Synthesis Guide

Yokoso synthesizes an entire atmospheric Kyoto mountain temple environment directly in code without requiring external 3D model files (.gltf / .obj).

```mermaid
graph TD
    ThreeInit[Three.js Scene & Camera Initialization] --> Geometry[Procedural Geometry Factory]
    Geometry --> Pagoda[Tiered Pagoda & Roof Eaves]
    Geometry --> Torii[Vermilion Torii Shinto Gates]
    Geometry --> Lanterns[Stone Toro Lanterns & Emitters]
    Geometry --> Terrain[Displaced Perlin Noise Mountain Terrain]
    ThreeInit --> Shaders[Custom GLSL Shader Pipelines]
    Shaders --> Fog[Volumetric Mountain Fog Shader]
    Shaders --> Sakura[Drifting Sakura Petal Turbulence]
    Shaders --> Rain[Procedural Rain & Specular Puddle Reflections]
    Shaders --> Moon[Vermilion Moon Bloom Post-Process]
    ThreeInit --> Lenis[Lenis Smooth Scroll Curve]
    Lenis --> Camera[Bezier 3D Spline Flight Controller]
```

## 1. Zero-Asset Architectural Synthesis

- **Pagoda Tiering:** Recursive procedural scaling with curved overhang eaves computed via parabolic coordinate offsets.
- **Torii Gates:** Cylindrical pillars with tapered kasagi upper lintels rendered in vermilion lacquer tones.
- **Stone Lanterns (Tōrō):** Hexagonal base, fire box (hibukuro) with procedural warm flicker point light, and peaked umbrella roof (kasa).
- **Procedural Mountain Terrain:** PlaneGeometry vertex displacement using layered simplex octaves for realistic ridgelines.
