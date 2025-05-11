import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

function lerpVector3(v1, v2, alpha) {
    return v1.clone().lerp(v2, alpha);
}

function createTextSprite(message, parameters = {}) {
    const { fontsize = 25, fontface = 'Arial', textColor = { r: 255, g: 255, b: 255, a: 1.0 },
        backgroundColor = { r: 0, g: 0, b: 0, a: 0.0 }, scaleFactor = 0.12 } = parameters;

    const canvas = document.createElement('canvas');
    const context = canvas.getContext('2d');
    context.font = `Bold ${fontsize}px ${fontface}`;
    const metrics = context.measureText(message);
    const textWidth = metrics.width;
    const padding = fontsize * 0.2;
    canvas.width = textWidth + 2 * padding;
    canvas.height = fontsize + 2 * padding;

    if (backgroundColor.a > 0) {
        context.fillStyle = `rgba(${backgroundColor.r},${backgroundColor.g},${backgroundColor.b},${backgroundColor.a})`;
        context.fillRect(0, 0, canvas.width, canvas.height);
    }

    context.font = `Bold ${fontsize}px ${fontface}`;
    context.fillStyle = `rgba(${textColor.r},${textColor.g},${textColor.b},${textColor.a})`;
    context.textAlign = 'center';
    context.textBaseline = 'middle';
    context.fillText(message, canvas.width / 2, canvas.height / 2);

    const texture = new THREE.CanvasTexture(canvas);
    texture.needsUpdate = true;

    const spriteMaterial = new THREE.SpriteMaterial({ map: texture, depthTest: false, transparent: backgroundColor.a < 1.0 });
    const sprite = new THREE.Sprite(spriteMaterial);
    sprite.scale.set(scaleFactor * canvas.width / fontsize, scaleFactor * canvas.height / fontsize, 1.0);
    sprite.userData = { fontsize, fontface, textColor, scaleFactor };

    return sprite;
}

export class Stage5Scene {
    constructor() {
        this.objects = [];
        this.mpuData = [];
        this.gridLines = null;
        this.time = 0;
        this.transitionDuration = 8.0;
        this.progress = 0;

        this.statusLabel = null;
        this.potentialLabel = null;

        this.controls = null;
    }

    updateTextSprite(sprite, message) {
        if (!sprite || !sprite.material || !sprite.material.map) return;
        const oldTexture = sprite.material.map;
        const params = sprite.userData || {};
        const canvas = document.createElement('canvas');
        const context = canvas.getContext('2d');
        const fontsize = params.fontsize || 25;
        const fontface = params.fontface || 'Arial';
        context.font = `Bold ${fontsize}px ${fontface}`;
        const metrics = context.measureText(message);
        const textWidth = metrics.width;
        const padding = fontsize * 0.2;
        canvas.width = textWidth + 2 * padding;
        canvas.height = fontsize + 2 * padding;

        context.font = `Bold ${fontsize}px ${fontface}`;
        const textColor = params.textColor || { r: 255, g: 255, b: 255, a: 1.0 };
        context.fillStyle = `rgba(${textColor.r},${textColor.g},${textColor.b},${textColor.a})`;
        context.textAlign = 'center';
        context.textBaseline = 'middle';
        context.fillText(message, canvas.width / 2, canvas.height / 2);

        const newTexture = new THREE.CanvasTexture(canvas);
        newTexture.needsUpdate = true;

        sprite.material.map = newTexture;
        const scaleFactor = params.scaleFactor || 0.12;
        sprite.scale.set(scaleFactor * canvas.width / fontsize, scaleFactor * canvas.height / fontsize, 1.0);
        if (oldTexture) oldTexture.dispose();
    }


    init(scene, camera, renderer) {
        console.log("Initializing Stage 5 Scene");
        this.time = 0;
        this.progress = 0;

        const gridSize = 7;
        const spacing = 1.5;
        const gridHalfSize = (gridSize - 1) * spacing / 2;
        const randomSpread = gridHalfSize * 1.3;

        const mpuGeometry = new THREE.SphereGeometry(0.15, 12, 8);
        const mpuMaterial = new THREE.MeshStandardMaterial({ color: 0xcccccc, roughness: 0.6, metalness: 0.2 });
        this.objects.push(mpuMaterial);

        for (let i = 0; i < gridSize; i++) {
            for (let j = 0; j < gridSize; j++) {
                for (let k = 0; k < gridSize; k++) {
                    const targetPos = new THREE.Vector3(
                        -gridHalfSize + i * spacing,
                        -gridHalfSize + j * spacing,
                        -gridHalfSize + k * spacing
                    );

                    const initialPos = new THREE.Vector3(
                        (Math.random() - 0.5) * 2 * randomSpread,
                        (Math.random() - 0.5) * 2 * randomSpread,
                        (Math.random() - 0.5) * 2 * randomSpread
                    );

                    const mesh = new THREE.Mesh(mpuGeometry, mpuMaterial);
                    mesh.position.copy(initialPos);

                    scene.add(mesh);
                    this.mpuData.push({ mesh, initialPos, targetPos });
                    this.objects.push(mesh);
                }
            }
        }
        this.objects.push(mpuGeometry);


        const linesMaterial = new THREE.LineBasicMaterial({ color: 0x00ff00, transparent: true, opacity: 0.0 });
        this.objects.push(linesMaterial);
        const points = [];
        const gridIndices = Array.from({ length: gridSize }, (_, i) => -gridHalfSize + i * spacing);

        gridIndices.forEach(y => gridIndices.forEach(z => {
            points.push(new THREE.Vector3(-gridHalfSize, y, z), new THREE.Vector3(gridHalfSize, y, z));
        }));
        gridIndices.forEach(x => gridIndices.forEach(z => {
            points.push(new THREE.Vector3(x, -gridHalfSize, z), new THREE.Vector3(x, gridHalfSize, z));
        }));
        gridIndices.forEach(x => gridIndices.forEach(y => {
            points.push(new THREE.Vector3(x, y, -gridHalfSize), new THREE.Vector3(x, y, gridHalfSize));
        }));

        const linesGeometry = new THREE.BufferGeometry().setFromPoints(points);
        this.objects.push(linesGeometry);
        this.gridLines = new THREE.LineSegments(linesGeometry, linesMaterial);
        scene.add(this.gridLines);
        this.objects.push(this.gridLines);


        const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
        scene.add(ambientLight); this.objects.push(ambientLight);
        const pointLight = new THREE.PointLight(0xffffff, 0.8, 100);
        pointLight.position.set(gridHalfSize * 1.5, gridHalfSize * 1.5, gridHalfSize * 2);
        scene.add(pointLight); this.objects.push(pointLight);

        camera.position.set(gridHalfSize * 1.5, gridHalfSize * 1.0, gridHalfSize * 2.5);
        camera.lookAt(0, 0, 0);
        this.controls = new OrbitControls(camera, renderer.domElement);
        this.controls.target.set(0, 0, 0);
        this.controls.enableDamping = true;
        this.controls.dampingFactor = 0.1;
        this.objects.push(this.controls);
    }

    update(deltaTime) {
        this.time += deltaTime;
        this.progress = Math.min(1.0, this.time / this.transitionDuration);

        const smoothProgress = this.progress * this.progress * (3 - 2 * this.progress);

        this.mpuData.forEach(data => {
            const currentPos = lerpVector3(data.initialPos, data.targetPos, smoothProgress);
            data.mesh.position.copy(currentPos);
        });

        if (this.gridLines) {
            this.gridLines.material.opacity = smoothProgress * 0.4;
        }

        let statusText = "Status: Disordered Network";
        let potentialText = `PCE Potential: ${(150 * (1 - smoothProgress) + 10).toFixed(0)}`;
        let potentialColor = { r: 255, g: 100, b: 100, a: 1.0 };

        if (this.progress > 0.1 && this.progress < 0.9) {
            statusText = "Status: Organizing (POP/PCE driven)...";
        } else if (this.progress >= 0.9) {
            statusText = "Status: Geometric Regularity Emerged";
            potentialText = "PCE Potential: LOW (Stable)";
            potentialColor = { r: 100, g: 255, b: 100, a: 1.0 };
        }

        this.updateTextSprite(this.statusLabel, statusText);
        this.potentialLabel.userData.textColor = potentialColor;
        this.updateTextSprite(this.potentialLabel, potentialText);


        if (this.controls) {
            this.controls.update();
        }
    }

    cleanup(scene) {
        console.log("Cleaning up Stage 5 Scene");

        if (this.controls) {
            this.controls.dispose();
            this.controls = null;
        }

        this.mpuData.forEach(data => {
            if (data.mesh && scene) scene.remove(data.mesh);
        });

        this.objects.forEach(obj => {
            if (obj && scene) {
                scene.remove(obj);
            }
            if (obj) {
                if (obj.geometry) obj.geometry.dispose();
                if (obj.material) {
                    if (Array.isArray(obj.material)) {
                        obj.material.forEach(material => {
                            if (material.map) material.map.dispose();
                            material.dispose();
                        });
                    } else {
                        if (obj.material.map) obj.material.map.dispose();
                        obj.material.dispose();
                    }
                }
                if (obj.texture) obj.texture.dispose();
            }
        });

        this.objects = [];
        this.mpuData = [];
        this.gridLines = null;
        this.statusLabel = null;
        this.potentialLabel = null;
    }
}