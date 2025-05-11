import * as THREE from 'three';
import { setupUI } from './ui.js';
import { StageManager } from './stages/stageManager.js';

let scene, camera, renderer, stageManager;
let clock = new THREE.Clock();

function init() {
    // Basic Scene Setup
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0x1a1a2e); // Match container background

    // Camera
    const container = document.getElementById('visualization-container');
    // Ensure container exists before accessing properties
    if (!container) {
        console.error("Visualization container not found!");
        return;
    }
    const aspect = container.clientWidth / container.clientHeight;
    camera = new THREE.PerspectiveCamera(75, aspect, 0.1, 1000);
    camera.position.z = 5;

    // Renderer
    renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(container.clientWidth, container.clientHeight);
    renderer.setPixelRatio(window.devicePixelRatio);
    container.appendChild(renderer.domElement);

    // Stage Manager
    stageManager = new StageManager(scene, camera, renderer);

    // UI Setup (pass the function to switch stages)
    setupUI(switchToStage);

    // Initial Stage Load
    switchToStage(1); // Load stage 1 by default

    // Handle Resize
    window.addEventListener('resize', onWindowResize, false);

    // Start Animation Loop
    animate();
}

function switchToStage(stageNumber) {
    console.log(`Switching to Stage ${stageNumber}`);
    if (stageManager) {
        stageManager.loadStage(stageNumber);
    } else {
        console.error("StageManager not initialized.");
    }
}

function onWindowResize() {
    const container = document.getElementById('visualization-container');
    // Ensure elements exist before updating
    if (!container || !camera || !renderer) return;

    // Update camera aspect ratio
    camera.aspect = container.clientWidth / container.clientHeight;
    camera.updateProjectionMatrix();

    // Update renderer size
    renderer.setSize(container.clientWidth, container.clientHeight);
}

function animate() {
    requestAnimationFrame(animate);

    const deltaTime = clock.getDelta();

    // Update current stage
    if (stageManager) {
        stageManager.update(deltaTime);
    }

    // Render scene (ensure elements exist)
    if (renderer && scene && camera) {
        renderer.render(scene, camera);
    }
}

// Start initialization when the DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
} else {
    // DOMContentLoaded has already fired
    init();
}