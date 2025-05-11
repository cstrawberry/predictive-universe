import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

function createTextSprite(message, parameters = {}) {
    const { fontsize = 50, fontface = 'Arial', textColor = { r: 255, g: 255, b: 255, a: 1.0 },
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

    const referenceSize = 25;
    sprite.scale.set(
        scaleFactor * (canvas.width / referenceSize),
        scaleFactor * (canvas.height / referenceSize),
        1.0
    );

    sprite.userData = { fontsize, fontface, textColor, scaleFactor, referenceSize };

    return sprite;
}

function updateTextSprite(sprite, message) {
    if (!sprite || !sprite.material || !sprite.material.map) return;
    const oldTexture = sprite.material.map;
    const params = sprite.userData || {};
    const canvas = document.createElement('canvas');
    const context = canvas.getContext('2d');
    const fontsize = params.fontsize || 50;
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
    const referenceSize = params.referenceSize || 25;
    sprite.scale.set(
        scaleFactor * (canvas.width / referenceSize),
        scaleFactor * (canvas.height / referenceSize),
        1.0
    );

    if (oldTexture) oldTexture.dispose();
}

export class Stage3Scene {
    constructor() {
        this.objects = [];
        this.centralMPU = null;
        this.outcomes = {
            zero: null,
            one: null
        };
        this.probabilityBars = {
            zero: null,
            one: null
        };
        this.labels = {
            title: null,
            state: null,
            zeroProb: null,
            oneProb: null,
            born: null,
            label0: null,
            label1: null
        };
        this.time = 0;
        this.cycleDuration = 8.0;
        this.decisionMade = false;
        this.chosenOutcome = null;
        this.controls = null;
        this.pathLines = {
            zero: null,
            one: null
        };
        this.animState = 'superposition';

        this.baseProb0 = 0.75;
        this.baseProb1 = 0.25;
    }

    init(scene, camera, renderer) {
        console.log("Initializing Stage 3 Scene: SPAP & Quantum Randomness");
        this.time = 0;
        this.decisionMade = false;
        this.animState = 'superposition';

        const mpuGeometry = new THREE.SphereGeometry(0.5, 32, 32);
        const mpuMaterial = new THREE.MeshStandardMaterial({
            color: 0x00aaff,
            emissive: 0x0033aa,
            emissiveIntensity: 0.3,
            roughness: 0.4,
            metalness: 0.6
        });
        this.centralMPU = new THREE.Mesh(mpuGeometry, mpuMaterial);
        scene.add(this.centralMPU);
        this.objects.push(this.centralMPU, mpuGeometry, mpuMaterial);

        const outcomeGeometry = new THREE.SphereGeometry(0.4, 16, 16);

        const zeroMaterial = new THREE.MeshStandardMaterial({
            color: 0x0088ff,
            roughness: 0.5,
            metalness: 0.3,
            transparent: true,
            opacity: 0.5,
            wireframe: true
        });
        this.outcomes.zero = new THREE.Mesh(outcomeGeometry, zeroMaterial);
        this.outcomes.zero.position.set(-3, 0, 0);
        scene.add(this.outcomes.zero);
        this.objects.push(this.outcomes.zero, zeroMaterial);

        const oneMaterial = new THREE.MeshStandardMaterial({
            color: 0xff8800,
            roughness: 0.5,
            metalness: 0.3,
            transparent: true,
            opacity: 0.5,
            wireframe: true
        });
        this.outcomes.one = new THREE.Mesh(outcomeGeometry, oneMaterial);
        this.outcomes.one.position.set(3, 0, 0);
        scene.add(this.outcomes.one);
        this.objects.push(this.outcomes.one, oneMaterial, outcomeGeometry);

        const barZeroGeometry = new THREE.BoxGeometry(0.6, 2, 0.2);
        const barZeroMaterial = new THREE.MeshStandardMaterial({
            color: 0x0088ff,
            roughness: 0.4
        });
        this.probabilityBars.zero = new THREE.Mesh(barZeroGeometry, barZeroMaterial);
        this.probabilityBars.zero.position.set(-3, -2, 0);
        this.probabilityBars.zero.scale.set(1, this.baseProb0, 1);
        scene.add(this.probabilityBars.zero);
        this.objects.push(this.probabilityBars.zero, barZeroGeometry, barZeroMaterial);

        const barOneGeometry = new THREE.BoxGeometry(0.6, 2, 0.2);
        const barOneMaterial = new THREE.MeshStandardMaterial({
            color: 0xff8800,
            roughness: 0.4
        });
        this.probabilityBars.one = new THREE.Mesh(barOneGeometry, barOneMaterial);
        this.probabilityBars.one.position.set(3, -2, 0);
        this.probabilityBars.one.scale.set(1, this.baseProb1, 1);
        scene.add(this.probabilityBars.one);
        this.objects.push(this.probabilityBars.one, barOneGeometry, barOneMaterial);

        const pathMaterial = new THREE.LineBasicMaterial({
            color: 0xffffff,
            transparent: true,
            opacity: 0.4,
            linewidth: 2
        });
        this.objects.push(pathMaterial);

        const controlPoint0 = new THREE.Vector3(-1.5, 1, 0);
        const curve0 = new THREE.QuadraticBezierCurve3(
            this.centralMPU.position,
            controlPoint0,
            this.outcomes.zero.position
        );
        const pathPoints0 = curve0.getPoints(20);
        const pathGeometry0 = new THREE.BufferGeometry().setFromPoints(pathPoints0);
        this.pathLines.zero = new THREE.Line(pathGeometry0, pathMaterial.clone());
        scene.add(this.pathLines.zero);
        this.objects.push(this.pathLines.zero, pathGeometry0);
        this.objects.push(this.pathLines.zero.material);

        const controlPoint1 = new THREE.Vector3(1.5, 1, 0);
        const curve1 = new THREE.QuadraticBezierCurve3(
            this.centralMPU.position,
            controlPoint1,
            this.outcomes.one.position
        );
        const pathPoints1 = curve1.getPoints(20);
        const pathGeometry1 = new THREE.BufferGeometry().setFromPoints(pathPoints1);
        this.pathLines.one = new THREE.Line(pathGeometry1, pathMaterial.clone());
        scene.add(this.pathLines.one);
        this.objects.push(this.pathLines.one, pathGeometry1);
        this.objects.push(this.pathLines.one.material);

        this.labels.zeroProb = createTextSprite(`P(0) = ${this.baseProb0.toFixed(2)}`, {
            fontsize: 45,
            textColor: { r: 150, g: 200, b: 255, a: 1.0 }
        });
        this.labels.zeroProb.position.set(-3, -3.5, 0);
        scene.add(this.labels.zeroProb);
        this.objects.push(this.labels.zeroProb);

        this.labels.oneProb = createTextSprite(`P(1) = ${this.baseProb1.toFixed(2)}`, {
            fontsize: 45,
            textColor: { r: 255, g: 200, b: 150, a: 1.0 }
        });
        this.labels.oneProb.position.set(3, -3.5, 0);
        scene.add(this.labels.oneProb);
        this.objects.push(this.labels.oneProb);

        this.labels.label0 = createTextSprite("|0⟩", {
            fontsize: 56,
            textColor: { r: 150, g: 200, b: 255, a: 1.0 }
        });
        this.labels.label0.position.set(-3, 0.9, 0);
        scene.add(this.labels.label0);
        this.objects.push(this.labels.label0);

        this.labels.label1 = createTextSprite("|1⟩", {
            fontsize: 56,
            textColor: { r: 255, g: 200, b: 150, a: 1.0 }
        });
        this.labels.label1.position.set(3, 0.9, 0);
        scene.add(this.labels.label1);
        this.objects.push(this.labels.label1);

        const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
        scene.add(ambientLight);
        this.objects.push(ambientLight);

        const dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
        dirLight.position.set(5, 8, 10);
        scene.add(dirLight);
        this.objects.push(dirLight);

        camera.position.set(0, 0, 6);
        camera.lookAt(0, 0, 0);
        this.controls = new OrbitControls(camera, renderer.domElement);
        this.controls.enableDamping = true;
        this.controls.dampingFactor = 0.1;
        this.controls.target.set(0, 0, 0);
        this.controls.minDistance = 3;
        this.controls.maxDistance = 20;
    }

    update(deltaTime) {
        this.time += deltaTime;
        const cycleTime = this.time % this.cycleDuration;
        const normalizedTime = cycleTime / this.cycleDuration;

        if (normalizedTime < 0.33) {
            if (this.animState !== 'superposition') {
                this.animState = 'superposition';
                this.decisionMade = false;
                this.pathLines.zero.material.opacity = 0.4;
                this.pathLines.one.material.opacity = 0.4;
                this.outcomes.zero.material.opacity = 0.5;
                this.outcomes.one.material.opacity = 0.5;
                this.outcomes.zero.material.wireframe = true;
                this.outcomes.one.material.wireframe = true;
                this.centralMPU.rotation.x = 0;
                this.centralMPU.rotation.y = 0;
            }

            this.centralMPU.rotation.y += deltaTime * 1.2;
            this.centralMPU.rotation.x += deltaTime * 0.8;
            const pulseFactor = 0.1 * Math.sin(this.time * 5) + 1.0;
            this.centralMPU.scale.set(pulseFactor, pulseFactor, pulseFactor);
            this.centralMPU.material.emissiveIntensity = 0.3 + 0.2 * Math.sin(this.time * 3);

            const probZero = this.baseProb0 + 0.1 * Math.sin(this.time * 2);
            const probOne = 1 - probZero;

            this.probabilityBars.zero.scale.y = probZero;
            this.probabilityBars.one.scale.y = probOne;

            updateTextSprite(this.labels.zeroProb, `P(0) = ${probZero.toFixed(2)}`);
            updateTextSprite(this.labels.oneProb, `P(1) = ${probOne.toFixed(2)}`);

        } else if (normalizedTime < 0.66) {
            if (this.animState !== 'decision') {
                this.animState = 'decision';

                const probZero = this.baseProb0;
                this.chosenOutcome = Math.random() < probZero ? 'zero' : 'one';

                this.probabilityBars.zero.scale.y = this.chosenOutcome === 'zero' ? 1 : 0.1;
                this.probabilityBars.one.scale.y = this.chosenOutcome === 'one' ? 1 : 0.1;

                updateTextSprite(this.labels.zeroProb, `P(0) = ${this.chosenOutcome === 'zero' ? '1.00' : '0.00'}`);
                updateTextSprite(this.labels.oneProb, `P(1) = ${this.chosenOutcome === 'one' ? '1.00' : '0.00'}`);
            }

            const transitionProgress = (normalizedTime - 0.33) * 3;

            this.pathLines.zero.material.opacity = this.chosenOutcome === 'zero' ?
                0.4 + 0.6 * transitionProgress : 0.4 * (1 - transitionProgress);

            this.pathLines.one.material.opacity = this.chosenOutcome === 'one' ?
                0.4 + 0.6 * transitionProgress : 0.4 * (1 - transitionProgress);

            const pulseFactor = 0.1 * Math.sin(this.time * 15) + 1.0;
            this.centralMPU.scale.set(pulseFactor, pulseFactor, pulseFactor);
            this.centralMPU.material.emissiveIntensity = 0.5 + 0.5 * Math.sin(this.time * 10);

            this.centralMPU.rotation.y += deltaTime * (1.2 - transitionProgress * 0.8);
            this.centralMPU.rotation.x += deltaTime * (0.8 - transitionProgress * 0.6);

            this.outcomes.zero.material.opacity = this.chosenOutcome === 'zero' ?
                0.5 + 0.5 * transitionProgress : 0.5 * (1 - transitionProgress);

            this.outcomes.one.material.opacity = this.chosenOutcome === 'one' ?
                0.5 + 0.5 * transitionProgress : 0.5 * (1 - transitionProgress);

            if (transitionProgress > 0.8) {
                if (this.chosenOutcome === 'zero') {
                    this.outcomes.zero.material.wireframe = false;
                } else {
                    this.outcomes.one.material.wireframe = false;
                }
            }

        } else {
            if (this.animState !== 'outcome') {
                this.animState = 'outcome';
                this.decisionMade = true;
            }

            this.centralMPU.scale.set(1, 1, 1);
            this.centralMPU.material.emissiveIntensity = 0.2;

            this.centralMPU.rotation.y += deltaTime * 0.1;
            this.centralMPU.rotation.x += deltaTime * 0.05;

            const outcomePulse = 0.05 * Math.sin(this.time * 3) + 1.0;
            this.outcomes.zero.scale.set(
                this.chosenOutcome === 'zero' ? outcomePulse : 1,
                this.chosenOutcome === 'zero' ? outcomePulse : 1,
                this.chosenOutcome === 'zero' ? outcomePulse : 1
            );
            this.outcomes.one.scale.set(
                this.chosenOutcome === 'one' ? outcomePulse : 1,
                this.chosenOutcome === 'one' ? outcomePulse : 1,
                this.chosenOutcome === 'one' ? outcomePulse : 1
            );

            this.outcomes.zero.material.opacity = this.chosenOutcome === 'zero' ? 1.0 : 0.1;
            this.outcomes.one.material.opacity = this.chosenOutcome === 'one' ? 1.0 : 0.1;

            this.outcomes.zero.material.wireframe = this.chosenOutcome !== 'zero';
            this.outcomes.one.material.wireframe = this.chosenOutcome !== 'one';

            this.pathLines.zero.material.opacity = this.chosenOutcome === 'zero' ? 1.0 : 0.0;
            this.pathLines.one.material.opacity = this.chosenOutcome === 'one' ? 1.0 : 0.0;
        }

        if (this.controls) {
            this.controls.update();
        }
    }

    cleanup(scene) {
        console.log("Cleaning up Stage 3 Scene");

        if (this.controls) {
            this.controls.dispose();
            this.controls = null;
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
                if (obj instanceof THREE.Texture) {
                    obj.dispose();
                }
            }
        });

        this.objects = [];
        this.centralMPU = null;
        this.outcomes.zero = null;
        this.outcomes.one = null;
        this.probabilityBars.zero = null;
        this.probabilityBars.one = null;
        this.pathLines.zero = null;
        this.pathLines.one = null;

        this.labels.zeroProb = null;
        this.labels.oneProb = null;
        this.labels.label0 = null;
        this.labels.label1 = null;
        this.labels.title = null;
        this.labels.state = null;
        this.labels.born = null;
    }
}