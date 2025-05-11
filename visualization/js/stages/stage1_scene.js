import * as THREE from 'three';

export class Stage1Scene {
    constructor() {
        this.objects = [];
        this.indicator = null;
        this.alphaLine = null;
        this.betaLine = null;
        this.alphaLabel = null;
        this.betaLabel = null;
        this.time = 0;

        this.defaultColor = new THREE.Color(0x0077ff);
        this.alphaColor = new THREE.Color(0xff4444);
        this.betaColor = new THREE.Color(0xffff44);
    }

    init(scene, camera, renderer) {
        console.log("Initializing Stage 1 Scene: MPU Cycle");

        const geometry = new THREE.SphereGeometry(0.5, 32, 16);
        const material = new THREE.MeshStandardMaterial({ color: this.defaultColor });
        this.indicator = new THREE.Mesh(geometry, material);
        this.indicator.position.x = 0;
        scene.add(this.indicator);
        this.objects.push(this.indicator, geometry, material);

        const lineMaterial = new THREE.LineBasicMaterial({ color: 0xffaa00 });
        const pointsAlpha = [new THREE.Vector3(-3, -2, 0), new THREE.Vector3(3, -2, 0)];
        const pointsBeta = [new THREE.Vector3(-3, 2, 0), new THREE.Vector3(3, 2, 0)];
        const geometryAlpha = new THREE.BufferGeometry().setFromPoints(pointsAlpha);
        const geometryBeta = new THREE.BufferGeometry().setFromPoints(pointsBeta);

        this.alphaLine = new THREE.Line(geometryAlpha, lineMaterial);
        this.betaLine = new THREE.Line(geometryBeta, lineMaterial.clone());

        scene.add(this.alphaLine);
        scene.add(this.betaLine);
        this.objects.push(this.alphaLine, this.betaLine, geometryAlpha, geometryBeta, lineMaterial);

        this.alphaLabel = this.createTextSprite("α", { x: 3.5, y: -2, z: 0 });
        this.betaLabel = this.createTextSprite("β", { x: 3.5, y: 2, z: 0 });
        scene.add(this.alphaLabel);
        scene.add(this.betaLabel);
        this.objects.push(this.alphaLabel, this.betaLabel);

        const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
        scene.add(ambientLight);
        this.objects.push(ambientLight);

        const directionalLight = new THREE.DirectionalLight(0xffffff, 0.8);
        directionalLight.position.set(1, 1, 1).normalize();
        scene.add(directionalLight);
        this.objects.push(directionalLight);

        camera.position.set(0, 0, 8);
        camera.lookAt(0, 0, 0);
    }

    createTextSprite(message, position) {
        const canvas = document.createElement('canvas');
        const context = canvas.getContext('2d');
        const fontSize = 20;
        context.font = `Bold ${fontSize}px Arial`;
        const textWidth = context.measureText(message).width;

        canvas.width = textWidth + 20;
        canvas.height = fontSize + 10;

        context.font = `Bold ${fontSize}px Arial`;
        context.fillStyle = "rgba(255, 255, 255, 0.95)";
        context.textAlign = 'center';
        context.textBaseline = 'middle';
        context.fillText(message, canvas.width / 2, canvas.height / 2);

        const texture = new THREE.CanvasTexture(canvas);
        texture.needsUpdate = true;

        const spriteMaterial = new THREE.SpriteMaterial({ map: texture, depthTest: false });
        const sprite = new THREE.Sprite(spriteMaterial);

        sprite.scale.set(canvas.width * 0.02, canvas.height * 0.02, 1.0);
        sprite.position.set(position.x, position.y, position.z);

        this.objects.push(texture, spriteMaterial);

        return sprite;
    }

    update(deltaTime) {
        this.time += deltaTime;

        if (this.indicator && this.indicator.material) {
            const basePP = 0;
            const amplitude = 1.3;
            const frequency = 0.2;

            const targetY = basePP + amplitude * Math.sin(this.time * frequency * 2 * Math.PI);

            const easeStrength = 0.05;
            const currentY = this.indicator.position.y;
            const newY = currentY + (targetY - currentY) * (1 - Math.exp(-deltaTime / easeStrength));
            this.indicator.position.y = newY;

            const alphaPosition = -2;
            const betaPosition = 2;

            const normalizedPosition = Math.max(0, Math.min(1, (newY - alphaPosition) / (betaPosition - alphaPosition)));

            if (normalizedPosition < 0.5) {
                const t = normalizedPosition * 2;
                this.indicator.material.color.copy(this.alphaColor).lerp(this.defaultColor, t);
            } else {
                const t = (normalizedPosition - 0.5) * 2;
                this.indicator.material.color.copy(this.defaultColor).lerp(this.betaColor, t);
            }
        }
    }

    cleanup(scene) {
        console.log("Cleaning up Stage 1 Scene");
        this.objects.forEach(obj => {
            if (obj) {
                if (obj instanceof THREE.Object3D) {
                    scene.remove(obj);
                }
                if (obj.geometry) {
                    obj.geometry.dispose();
                }
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
                if (obj instanceof THREE.Texture) {
                    obj.dispose();
                }
            }
        });
        this.objects = [];
        this.indicator = null;
        this.alphaLine = null;
        this.betaLine = null;
        this.alphaLabel = null;
        this.betaLabel = null;
    }
}