import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

function lerp(start, end, alpha) {
    return start * (1 - alpha) + end * alpha;
}

export class Stage2Scene {
    constructor() {
        this.objects = [];
        this.networkGroup = null;
        this.mpuData = [];
        this.connectionLines = null;
        this.controls = null;

        this.time = 0;
        this.networkLoadTarget = 0.5;
        this.adaptationSpeed = 0.8;
        this.spatialVariationFactor = 0.4;
        this.noiseFactor = 0.15;

        this.lowActivityColor = new THREE.Color(0x0077ff);
        this.highActivityColor = new THREE.Color(0xff4444);
        this.minActivityScale = 0.3;
        this.maxActivityScale = 0.8;
    }

    init(scene, camera, renderer) {
        console.log("Initializing Stage 2 Scene: Network Adaptation (9x9 Grid)");
        this.time = 0;
        this.networkLoadTarget = 0.5;
        this.mpuData = [];
        this.objects = [];

        this.networkGroup = new THREE.Group();
        scene.add(this.networkGroup);
        this.objects.push(this.networkGroup);

        const gridWidth = 9;
        const gridHeight = 9;
        const spacing = 1.8;

        const offsetX = - (gridWidth - 1) * spacing / 2;
        const offsetY = - (gridHeight - 1) * spacing / 2;

        const mpuGeometry = new THREE.SphereGeometry(0.5, 16, 8);
        this.objects.push(mpuGeometry);

        for (let i = 0; i < gridWidth; i++) {
            for (let j = 0; j < gridHeight; j++) {
                const mpuMaterial = new THREE.MeshStandardMaterial({
                    color: this.lowActivityColor.clone(),
                    roughness: 0.6,
                    metalness: 0.1
                });
                this.objects.push(mpuMaterial);

                const mesh = new THREE.Mesh(mpuGeometry, mpuMaterial);

                mesh.position.set(
                    offsetX + i * spacing,
                    offsetY + j * spacing,
                    (Math.random() - 0.5) * 0.4
                );

                const data = {
                    mesh: mesh,
                    material: mpuMaterial,
                    gridCoords: { i, j },
                    targetActivity: this.networkLoadTarget,
                    currentActivity: Math.random() * 0.2,
                };
                this.mpuData.push(data);

                this.networkGroup.add(mesh);
            }
        }

        const lineMaterial = new THREE.LineBasicMaterial({
            color: 0x666688,
            transparent: true,
            opacity: 0.15
        });
        this.objects.push(lineMaterial);

        const points = [];
        for (let i = 0; i < this.mpuData.length; i++) {
            for (let j = i + 1; j < this.mpuData.length; j++) {
                const pos1 = this.mpuData[i].mesh.position;
                const pos2 = this.mpuData[j].mesh.position;
                const distSq = pos1.distanceToSquared(pos2);
                if (distSq < (spacing * spacing * 1.1)) {
                    points.push(pos1.x, pos1.y, pos1.z);
                    points.push(pos2.x, pos2.y, pos2.z);
                }
            }
        }

        const lineGeometry = new THREE.BufferGeometry();
        lineGeometry.setAttribute('position', new THREE.Float32BufferAttribute(points, 3));
        this.objects.push(lineGeometry);

        this.connectionLines = new THREE.LineSegments(lineGeometry, lineMaterial);
        this.networkGroup.add(this.connectionLines);

        const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
        scene.add(ambientLight);
        this.objects.push(ambientLight);

        const dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
        dirLight.position.set(-5, 8, 10);
        scene.add(dirLight);
        this.objects.push(dirLight);

        camera.position.set(0, 0, 17);
        camera.lookAt(0, 0, 0);

        this.controls = new OrbitControls(camera, renderer.domElement);
        this.controls.enableDamping = true;
        this.controls.dampingFactor = 0.1;
        this.controls.target.set(0, 0, 0);
    }

    update(deltaTime) {
        this.time += deltaTime;

        this.networkLoadTarget = 0.5 + 0.45 * Math.sin(this.time * 0.4);

        const gridWidth = 9;
        const gridHeight = 9;

        this.mpuData.forEach((data) => {
            const { i, j } = data.gridCoords;

            const freqX = 1.8 * Math.PI / gridWidth;
            const freqY = 1.3 * Math.PI / gridHeight;
            const spatialFactor = 0.5 + 0.5 * Math.sin(i * freqX + this.time * 0.1) * Math.cos(j * freqY - this.time * 0.05);

            let baseTarget = this.networkLoadTarget;
            let modulatedTarget = baseTarget + (spatialFactor - 0.5) * this.spatialVariationFactor * baseTarget * 2;
            let noisyTarget = modulatedTarget + (Math.random() - 0.5) * this.noiseFactor;

            data.targetActivity = Math.max(0, Math.min(1, noisyTarget));

            data.currentActivity = lerp(
                data.currentActivity,
                data.targetActivity,
                1.0 - Math.exp(-this.adaptationSpeed * deltaTime)
            );

            const activityFactor = data.currentActivity;

            data.material.color.lerpColors(this.lowActivityColor, this.highActivityColor, activityFactor);

            const scale = lerp(this.minActivityScale, this.maxActivityScale, activityFactor);
            data.mesh.scale.set(scale, scale, scale);
        });

        if (this.controls) {
            this.controls.update();
        }
    }

    cleanup(scene) {
        console.log("Cleaning up Stage 2 Scene (9x9 Grid)");

        if (this.controls) {
            this.controls.dispose();
            this.controls = null;
        }

        this.objects.forEach(obj => {
            if (obj instanceof THREE.Object3D) {
                scene.remove(obj);
            }
        });

        this.objects.forEach(obj => {
            if (obj) {
                if (obj.geometry) obj.geometry.dispose();
                if (obj.material) {
                    if (Array.isArray(obj.material)) {
                        obj.material.forEach(material => material.dispose());
                    } else {
                        obj.material.dispose();
                    }
                }
                if (obj instanceof THREE.Texture) obj.dispose();
            }
        });

        this.objects = [];
        this.mpuData = [];
        this.networkGroup = null;
        this.connectionLines = null;
    }
}