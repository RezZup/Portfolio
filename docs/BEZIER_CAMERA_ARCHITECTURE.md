# Scroll-Driven 3D Bezier Camera Architecture

Yokoso translates 2D user scroll progress into smooth 3D spatial motion along a Catmull-Rom cubic spline.

## 1. Kinematic Camera Control

```javascript
// Catmull-Rom Spline Waypoints across Kyoto Temple Chapters
const CAMERA_PATH = new THREE.CatmullRomCurve3([
  new THREE.Vector3(0, 3, 25),    // Chapter 1: Torii Approach
  new THREE.Vector3(4, 5, 12),    // Chapter 2: Stone Lantern Stairway
  new THREE.Vector3(-2, 7, -5),   // Chapter 3: Inner Courtyard
  new THREE.Vector3(0, 12, -22),  // Chapter 4: Five-Story Pagoda Overlook
  new THREE.Vector3(0, 16, -40),  // Chapter 5: Moonlit Shrine & Project Portal
]);
```

- **Inertial Interpolation:** Lenis smooth scroll normalizes touch, trackpad, and mouse wheel inputs to normalized range $t \in [0, 1]$.
- **Target LookAt Damping:** Look-at orientation is dynamically smoothed via exponential slerp to avoid abrupt rotational velocity changes.
