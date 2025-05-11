import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

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


export class Stage6Scene {
    constructor() {
        this.objects = [];
        this.gridPlane = null;
        this.centralMass = null;
        this.testParticles = [];

        this.infoLabel = null;
        this.massLabel = null;
        this.scaleLabel = null;

        this.time = 0;
        this.gridVertices = null;
        this.gravityStrength = 0.0;
        this.scaleFactor = 1.0;
        this.isScaleDependentMode = false;

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
        console.log("Initializing Stage 6 Scene");
        this.time = 0;
        this.gravityStrength = 0.0;
        this.scaleFactor = 1.0;
        this.isScaleDependentMode = false;

        const gridSize = 20;
        const gridSegments = 40;
        const gridGeometry = new THREE.PlaneGeometry(gridSize, gridSize, gridSegments, gridSegments);
        const gridMaterial = new THREE.MeshStandardMaterial({
            color: 0x336699,
            wireframe: true,
            roughness: 0.8,
            metalness: 0.1
        });
        this.gridPlane = new THREE.Mesh(gridGeometry, gridMaterial);
        this.gridPlane.rotation.x = -Math.PI / 2;
        scene.add(this.gridPlane);
        this.objects.push(this.gridPlane);
        this.objects.push(gridGeometry);
        this.objects.push(gridMaterial);
        this.gridVertices = Array.from(this.gridPlane.geometry.attributes.position.array);

        const massGeometry = new THREE.SphereGeometry(0.5, 32, 16);
        const massMaterial = new THREE.MeshStandardMaterial({
            color: 0xffdd44,
            emissive: 0xaa8800,
            emissiveIntensity: 0.0,
            roughness: 0.5,
        });
        this.centralMass = new THREE.Mesh(massGeometry, massMaterial);
        this.centralMass.position.y = 0.5;
        scene.add(this.centralMass);
        this.objects.push(this.centralMass);
        this.objects.push(massGeometry);
        this.objects.push(massMaterial);

        const particleGeometry = new THREE.SphereGeometry(0.1, 8, 8);
        const particleMaterial = new THREE.MeshBasicMaterial({ color: 0xffffff });
        this.objects.push(particleGeometry);
        this.objects.push(particleMaterial);
        for (let i = 0; i < 15; i++) {
            const angle = Math.random() * Math.PI * 2;
            const radius = 3 + Math.random() * 5;
            const particle = new THREE.Mesh(particleGeometry, particleMaterial);
            particle.position.set(radius * Math.cos(angle), 0.1, radius * Math.sin(angle));
            particle.userData = { angle: angle, radius: radius, speed: (0.5 + Math.random() * 0.5) / radius };
            scene.add(particle);
            this.testParticles.push(particle);
            this.objects.push(particle);
        }

        const ambientLight = new THREE.AmbientLight(0xffffff, 0.4);
        scene.add(ambientLight); this.objects.push(ambientLight);
        const dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
        dirLight.position.set(5, 10, 7);
        scene.add(dirLight); this.objects.push(dirLight);

        camera.position.set(0, gridSize * 0.8, gridSize * 0.9);
        camera.lookAt(0, 0, 0);
        this.controls = new OrbitControls(camera, renderer.domElement);
        this.controls.target.set(0, 0, 0);
        this.controls.enableDamping = true;
        this.controls.dampingFactor = 0.1;
        this.objects.push(this.controls);

        this.modeSwitchTime = 10.0;
    }

    deformGrid(strength) {
        const positionAttribute = this.gridPlane.geometry.attributes.position;
        const gridHalfSize = this.gridPlane.geometry.parameters.width / 2;

        for (let i = 0; i < positionAttribute.count; i++) {
            const x = this.gridVertices[i * 3];
            const z = this.gridVertices[i * 3 + 2];
            const originalY = this.gridVertices[i * 3 + 1];

            const distSq = x * x + z * z;
            const maxDeformation = -gridHalfSize * 0.3 * strength;
            const falloff = 4.0;

            const deformation = maxDeformation * Math.exp(-distSq / (gridHalfSize * gridHalfSize / falloff));

            positionAttribute.setY(i, originalY + deformation);
        }
        positionAttribute.needsUpdate = true;
    }


    update(deltaTime) {
        this.time += deltaTime;

        if (Math.floor(this.time / this.modeSwitchTime) % 2 === 0) {
            if (!this.isScaleDependentMode) {
                this.isScaleDependentMode = true;
                this.massLabel.visible = true;
                this.scaleLabel.visible = false;
            }
            this.gravityStrength = (Math.sin(this.time * 0.4) + 1) / 2;
            this.scaleFactor = 1.0;

            this.centralMass.material.emissiveIntensity = this.gravityStrength * 0.8;

        } else {
            if (this.isScaleDependentMode) {
                this.isScaleDependentMode = false;
                this.massLabel.visible = false;
                this.scaleLabel.visible = true;
                this.centralMass.material.emissiveIntensity = 0.1;
            }
            this.scaleFactor = 1.0 + 1.0 * (Math.sin(this.time * 0.4) + 1) / 2;
            this.gravityStrength = 0.1 * this.scaleFactor;

            this.updateTextSprite(this.scaleLabel, `G Scaling Factor: ${this.scaleFactor.toFixed(2)}`);
        }

        this.deformGrid(this.gravityStrength);

        this.testParticles.forEach(p => {
            const effectiveSpeed = p.userData.speed * (1 + this.gravityStrength * 1.5);
            p.userData.angle += effectiveSpeed * deltaTime;
            const radius = p.userData.radius;

            const gridX = p.position.x;
            const gridZ = p.position.z;
            const distSq = gridX * gridX + gridZ * gridZ;
            const gridHalfSize = this.gridPlane.geometry.parameters.width / 2;
            const maxDeformation = -gridHalfSize * 0.3 * this.gravityStrength;
            const falloff = 4.0;
            const deformation = maxDeformation * Math.exp(-distSq / (gridHalfSize * gridHalfSize / falloff));
            const currentGridY = deformation;

            p.position.set(
                radius * Math.cos(p.userData.angle),
                currentGridY + 0.1,
                radius * Math.sin(p.userData.angle)
            );
        });

        if (this.controls) {
            this.controls.update();
        }
    }

    cleanup(scene) {
        console.log("Cleaning up Stage 6 Scene");

        if (this.controls) {
            this.controls.dispose();
            this.controls = null;
        }

        if (this.gridPlane && this.gridVertices) {
            this.gridPlane.geometry.attributes.position.array.set(this.gridVertices);
            this.gridPlane.geometry.attributes.position.needsUpdate = true;
        }

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
        this.gridPlane = null;
        this.centralMass = null;
        this.testParticles = [];
        this.gridVertices = null;
        this.infoLabel = null;
        this.massLabel = null;
        this.scaleLabel = null;
    }
}