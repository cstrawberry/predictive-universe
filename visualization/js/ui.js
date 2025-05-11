// Descriptions aimed at providing more context for each visualization stage
const stageDescriptions = {
    1: `<strong>Stage 1: MPU Cycle & Viability Bounds (α, β)</strong>: Illustrates a Minimal Predictive Unit (MPU), the fundamental constituent, executing its adaptive cycle (Predict-Verify-Update). Its Predictive Performance (PP, <em>sphere's vertical position</em>) must dynamically stay within the viable 'Space of Becoming' (between orange bounds α and β) to function. Below α risks failure; approaching β limits adaptability/efficiency. This requires minimal complexity C<sub>op</sub> (≥ K<sub>0</sub>=3 bits).`,

    2: `<strong>Stage 2: Network Adaptation & Efficiency (PCE)</strong>: Visualizes a network of MPUs adapting under the Principle of Compression Efficiency (PCE). Driven by a collective Prediction Optimization Problem (POP), each MPU adjusts its operational complexity/activity based on local predictive demands (influenced by conceptual Target Complexity Ĉ<sub>target</sub>) and resource costs, seeking optimal network-wide performance and efficiency.`,

    3: `<strong>Stage 3: Interaction Limits & Quantum Randomness</strong>: Focuses on an MPU's 'Evolve' interaction, governed by Non-Deterministic Reflexive Interaction Dynamics (ND-RID). The SPAP logical limit (Self-Referential Paradox of Accurate Prediction) forbids deterministic self-prediction, forcing probabilistic outcomes. The MPU actualizes into state |0⟩ or |1⟩ following Born Rule probabilities (<em>bar heights</em>), derived via PCE. This reflexive update is inherently irreversible, incurring a cost ε ≥ ln 2 and generating quantum-like randomness.`,

    4: `<strong>Stage 4: Consciousness Complexity (CC) & Biased Probability</strong>: Illustrates the Consciousness Complexity (CC) hypothesis. A complex MPU aggregate (<em>central structure</em>) generates a context field (<em>outer halo</em>) modulating the parameters of a local ND-RID 'Evolve' event. This biases the outcome probabilities: P<sub>obs</sub> (<em>bar heights</em>) shifts from the baseline Born Rule towards a context-defined target, weighted by the aggregate's CC value. The actualization remains probabilistic, incurs cost ε ≥ ln 2, and CC < 0.5 preserves causality.`,

    5: `<strong>Stage 5: Emergent Geometric Regularity</strong>: Depicts MPU network self-organization driven by PCE optimization. Irregular network structures (<em>initial random state</em>) incur higher costs (propagation, operational inefficiency) and reduced predictive coherence, representing a higher PCE Potential. Dynamics converge to a stable, geometrically regular lattice (<em>final state</em>, low potential), the necessary structure for emergent spacetime and viable prediction.`,

    6: `<strong>Stage 6: Emergent Gravity & Thermodynamics</strong>: Illustrates gravity emerging thermodynamically from the MPU network (via Area Law). (1) Local MPU activity/costs (Stress-Energy Tensor T<sub>μν</sub><sup>(MPU)</sup>, Def B.8, <em>central mass</em>) curve the emergent spacetime (<em>grid deformation</em>) via Einstein's Field Equations (EFE), guiding motion (<em>particle paths</em>). (2) Conceptually, on larger scales, PCE effects in sparse regions might cause G to increase (G(R)), mimicking dark matter.`
};
let currentActiveButton = null;

export function setupUI(switchStageCallback) {
    const controlsDiv = document.getElementById('controls');
    // Ensure controls exist before adding listeners
    if (!controlsDiv) {
        console.error("Controls container not found!");
        return;
    }
    const buttons = controlsDiv.querySelectorAll('button[data-stage]');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const stageNumber = parseInt(button.dataset.stage, 10);
            if (!isNaN(stageNumber)) {
                switchStageCallback(stageNumber); // Call the function in main.js
                setActiveButton(button); // Update button style immediately
                updateDescription(stageNumber); // Update text
            }
        });
    });

    // Set initial active button (Stage 1)
    const initialButton = document.getElementById('stage1-button');
    if (initialButton) {
        setActiveButton(initialButton);
        // Update description for initial load (handled by main.js calling switchToStage)
    }
}

function setActiveButton(activeButton) {
    if (currentActiveButton) {
        currentActiveButton.classList.remove('active');
    }
    if (activeButton) {
        activeButton.classList.add('active');
        currentActiveButton = activeButton;
    } else {
        currentActiveButton = null;
    }
}

export function updateDescription(stageNumber) {
    const descriptionDiv = document.getElementById('description');
    if (descriptionDiv) {
        // Use the more detailed descriptions
        descriptionDiv.innerHTML = stageDescriptions[stageNumber] || `Stage ${stageNumber}: Description not available. (Implementation may be pending)`;
    }
    // Optionally ensure the correct button is highlighted if called externally
    const button = document.querySelector(`#controls button[data-stage="${stageNumber}"]`);
    if (button && button !== currentActiveButton) {
        setActiveButton(button);
    }
}