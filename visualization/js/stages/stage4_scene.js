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

function smoothstep(x) {
    x = Math.max(0, Math.min(1, x));
    return x * x * (3 - 2 * x);
}

function lerp(start, end, alpha) {
    return start * (1 - alpha) + end * alpha;
}

export class Stage4Scene {
    constructor() {
        this.objects = [];
        this.centralMPU = null;
        this.outcomes = { zero: null, one: null };
        this.probabilityBars = { zero: null, one: null };
        this.pathLines = { zero: null, one: null };
        this.aggregateContext = null;
        this.microMpuGroup = null;
        this.labels = {
            probZero: null,
            probOne: null,
            targetBias: null,
            label0: null,
            label1: null
        };
        this.controls = null;

        this.time = 0;
        this.cycleDuration = 8.0;
        this.animState = 'superposition';
        this.chosenOutcome = null;
        this.decisionMade = false;

        this.baseProb0 = 0.75;
        this.targetProb0 = 0.75;
        this.ccStrength = 0.3;
        this.observedProb0 = 0.75;
    }

    init(scene, camera, renderer) {
        console.log("Initializing Stage 4 Scene: CC Bias (Matched to Stage3)");
        this.time = 0;
        this.animState = 'superposition';
        this.chosenOutcome = null;
        this.decisionMade = false;
        this.observedProb0 = this.baseProb0;

        const mpuGeometry = new THREE.SphereGeometry(0.5, 32, 32);
        const mpuMaterial = new THREE.MeshStandardMaterial({
            color: 0x00aaff,
            emissive: 0x0033aa,
            emissiveIntensity: 0.3,
            roughness: 0.4,
            metalness: 0.6,
            transparent: true,
            opacity: 0.7
        });
        this.centralMPU = new THREE.Mesh(mpuGeometry, mpuMaterial);
        scene.add(this.centralMPU);
        this.objects.push(this.centralMPU, mpuGeometry, mpuMaterial);

        this.microMpuGroup = new THREE.Group();
        const microMpuGeometry = new THREE.SphereGeometry(0.05, 8, 8);
        const microMpuMaterial = new THREE.MeshStandardMaterial({
            color: 0xaaddff,
            emissive: 0x3366aa,
            emissiveIntensity: 0.4,
            roughness: 0.3,
            metalness: 0.7
        });
        this.objects.push(microMpuGeometry, microMpuMaterial);

        const numMicroMpus = 20;
        const radius = 0.35;
        const mpuPositions = [];
        for (let i = 0; i < numMicroMpus; i++) {
            const theta = Math.random() * Math.PI * 2;
            const phi = Math.acos(2 * Math.random() - 1);
            const r = radius * Math.cbrt(Math.random());
            const x = r * Math.sin(phi) * Math.cos(theta);
            const y = r * Math.sin(phi) * Math.sin(theta);
            const z = r * Math.cos(phi);
            const mpuMesh = new THREE.Mesh(microMpuGeometry, microMpuMaterial);
            mpuMesh.position.set(x, y, z);
            const scale = 0.7 + Math.random() * 0.6;
            mpuMesh.scale.set(scale, scale, scale);
            this.microMpuGroup.add(mpuMesh);
            mpuPositions.push(new THREE.Vector3(x, y, z));
        }

        const connectionMaterial = new THREE.LineBasicMaterial({
            color: 0x66ccff,
            transparent: true,
            opacity: 0.4
        });
        this.objects.push(connectionMaterial);
        const maxConnectionDistSq = 0.35 * 0.35;
        for (let i = 0; i < mpuPositions.length; i++) {
            for (let j = i + 1; j < mpuPositions.length; j++) {
                if (mpuPositions[i].distanceToSquared(mpuPositions[j]) < maxConnectionDistSq) {
                    const lineGeometry = new THREE.BufferGeometry().setFromPoints([mpuPositions[i], mpuPositions[j]]);
                    const line = new THREE.Line(lineGeometry, connectionMaterial);
                    this.microMpuGroup.add(line);
                    this.objects.push(lineGeometry);
                }
            }
        }
        this.centralMPU.add(this.microMpuGroup);

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
        this.probabilityBars.zero.scale.set(1, this.observedProb0, 1);
        scene.add(this.probabilityBars.zero);
        this.objects.push(this.probabilityBars.zero, barZeroGeometry, barZeroMaterial);

        const barOneGeometry = new THREE.BoxGeometry(0.6, 2, 0.2);
        const barOneMaterial = new THREE.MeshStandardMaterial({
            color: 0xff8800,
            roughness: 0.4
        });
        this.probabilityBars.one = new THREE.Mesh(barOneGeometry, barOneMaterial);
        this.probabilityBars.one.position.set(3, -2, 0);
        this.probabilityBars.one.scale.set(1, 1 - this.observedProb0, 1);
        scene.add(this.probabilityBars.one);
        this.objects.push(this.probabilityBars.one, barOneGeometry, barOneMaterial);

        const contextGeometry = new THREE.SphereGeometry(1.0, 32, 32);
        const contextMaterial = new THREE.MeshStandardMaterial({
            color: 0xaaccff,
            emissive: 0x223366,
            emissiveIntensity: 0.2,
            roughness: 0.7,
            transparent: true,
            opacity: 0.15,
            side: THREE.FrontSide
        });
        this.aggregateContext = new THREE.Mesh(contextGeometry, contextMaterial);
        this.aggregateContext.position.copy(this.centralMPU.position);
        scene.add(this.aggregateContext);
        this.objects.push(this.aggregateContext, contextGeometry, contextMaterial);

        const pathMaterial = new THREE.LineBasicMaterial({
            color: 0xffffff,
            transparent: true,
            opacity: 0.4
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

        this.labels.probZero = createTextSprite(`P(0) = ${this.observedProb0.toFixed(2)}`, {
            fontsize: 45,
            textColor: { r: 150, g: 200, b: 255, a: 1.0 }
        });
        this.labels.probZero.position.set(-3, -3.5, 0);
        scene.add(this.labels.probZero);
        this.objects.push(this.labels.probZero);

        this.labels.probOne = createTextSprite(`P(1) = ${(1 - this.observedProb0).toFixed(2)}`, {
            fontsize: 45,
            textColor: { r: 255, g: 200, b: 150, a: 1.0 }
        });
        this.labels.probOne.position.set(3, -3.5, 0);
        scene.add(this.labels.probOne);
        this.objects.push(this.labels.probOne);

        this.labels.targetBias = createTextSprite(`Target: P(0) = ${this.targetProb0.toFixed(2)}`, {
            fontsize: 45,
            textColor: { r: 220, g: 220, b: 220, a: 0.8 }
        });
        this.labels.targetBias.position.set(0, 3.5, 0);
        scene.add(this.labels.targetBias);
        this.objects.push(this.labels.targetBias);

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

            this.targetProb0 = 0.5 + 0.4 * Math.sin(this.time * 0.4);

            const currentBaseProb0 = this.baseProb0;

            this.observedProb0 = lerp(currentBaseProb0, this.targetProb0, this.ccStrength);
            this.observedProb0 = Math.max(0.0, Math.min(1.0, this.observedProb0));

            this.centralMPU.rotation.y += deltaTime * 1.2;
            this.centralMPU.rotation.x += deltaTime * 0.8;
            const pulseFactor = 0.1 * Math.sin(this.time * 5) + 1.0;
            this.centralMPU.scale.set(pulseFactor, pulseFactor, pulseFactor);
            this.centralMPU.material.emissiveIntensity = 0.3 + 0.2 * Math.sin(this.time * 3);

            const contextPulse = 1.0 + 0.04 * Math.sin(this.time * 1.5);
            this.aggregateContext.scale.set(contextPulse, contextPulse, contextPulse);
            this.aggregateContext.material.opacity = 0.1 + 0.15 * Math.abs(this.targetProb0 - 0.5) * 2;
            const biasDirection = (this.targetProb0 - 0.5);
            this.aggregateContext.material.emissive.setHSL(0.6 - biasDirection * 0.4, 0.7, 0.2);

            if (this.microMpuGroup) {
                this.microMpuGroup.rotation.y += deltaTime * 0.2;
                this.microMpuGroup.rotation.x += deltaTime * 0.1;
                this.microMpuGroup.children.forEach((child, index) => {
                    if (child.type === 'Mesh') {
                        const pulse = 1.0 + 0.15 * Math.sin(this.time * (2 + biasDirection * 1.5) + index * 0.2);
                        child.scale.set(pulse, pulse, pulse);
                    }
                });
            }

            this.probabilityBars.zero.scale.y = this.observedProb0;
            this.probabilityBars.one.scale.y = 1 - this.observedProb0;

            updateTextSprite(this.labels.probZero, `P(0) = ${this.observedProb0.toFixed(2)}`);
            updateTextSprite(this.labels.probOne, `P(1) = ${(1 - this.observedProb0).toFixed(2)}`);
            updateTextSprite(this.labels.targetBias, `Target: P(0) = ${this.targetProb0.toFixed(2)} (Base: ${currentBaseProb0.toFixed(2)})`);


        } else if (normalizedTime < 0.66) {
            if (this.animState !== 'decision') {
                this.animState = 'decision';

                this.chosenOutcome = Math.random() < this.observedProb0 ? 'zero' : 'one';

                this.probabilityBars.zero.scale.y = this.chosenOutcome === 'zero' ? 1 : 0.05;
                this.probabilityBars.one.scale.y = this.chosenOutcome === 'one' ? 1 : 0.05;

                updateTextSprite(this.labels.probZero, `P(0) = ${this.chosenOutcome === 'zero' ? '1.00' : '0.00'}`);
                updateTextSprite(this.labels.probOne, `P(1) = ${this.chosenOutcome === 'one' ? '1.00' : '0.00'}`);
            }

            const transitionProgress = (normalizedTime - 0.33) * 3;

            this.pathLines.zero.material.opacity = this.chosenOutcome === 'zero' ?
                lerp(0.4, 1.0, smoothstep(transitionProgress)) : lerp(0.4, 0.0, smoothstep(transitionProgress));

            this.pathLines.one.material.opacity = this.chosenOutcome === 'one' ?
                lerp(0.4, 1.0, smoothstep(transitionProgress)) : lerp(0.4, 0.0, smoothstep(transitionProgress));

            const pulseFactor = 0.1 * Math.sin(this.time * 15) + 1.0;
            this.centralMPU.scale.set(pulseFactor, pulseFactor, pulseFactor);
            this.centralMPU.material.emissiveIntensity = lerp(0.5, 0.2, smoothstep(transitionProgress));

            this.centralMPU.rotation.y += deltaTime * lerp(1.2, 0.1, smoothstep(transitionProgress));
            this.centralMPU.rotation.x += deltaTime * lerp(0.8, 0.05, smoothstep(transitionProgress));

            this.outcomes.zero.material.opacity = this.chosenOutcome === 'zero' ?
                lerp(0.5, 1.0, smoothstep(transitionProgress)) : lerp(0.5, 0.1, smoothstep(transitionProgress));

            this.outcomes.one.material.opacity = this.chosenOutcome === 'one' ?
                lerp(0.5, 1.0, smoothstep(transitionProgress)) : lerp(0.5, 0.1, smoothstep(transitionProgress));

            this.aggregateContext.material.opacity = lerp(this.aggregateContext.material.opacity, 0.05, 0.1);

            if (transitionProgress > 0.7) {
                if (this.chosenOutcome === 'zero') this.outcomes.zero.material.wireframe = false;
                else this.outcomes.one.material.wireframe = false;
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

            this.aggregateContext.material.opacity = 0.05;

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

            this.outcomes.zero.material.opacity = this.chosenOutcome === 'zero' ? 1.0 : 0.05;
            this.outcomes.one.material.opacity = this.chosenOutcome === 'one' ? 1.0 : 0.05;

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
        console.log("Cleaning up Stage 4 Scene");

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
        this.aggregateContext = null;
        this.microMpuGroup = null;

        this.labels.probZero = null;
        this.labels.probOne = null;
        this.labels.targetBias = null;
        this.labels.label0 = null;
        this.labels.label1 = null;
    }
}