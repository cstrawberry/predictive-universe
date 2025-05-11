import { updateDescription } from '../ui.js';

// Import all stage scene classes
import { Stage1Scene } from './stage1_scene.js';
import { Stage2Scene } from './stage2_scene.js';
import { Stage3Scene } from './stage3_scene.js';
import { Stage4Scene } from './stage4_scene.js';
import { Stage5Scene } from './stage5_scene.js';
import { Stage6Scene } from './stage6_scene.js';

export class StageManager {
    constructor(scene, camera, renderer) {
        this.scene = scene;
        this.camera = camera;
        this.renderer = renderer;
        this.currentStage = null;
        this.currentStageNumber = -1;

        // Map stage numbers to their respective constructor functions
        this.stageConstructors = {
            1: Stage1Scene,
            2: Stage2Scene,
            3: Stage3Scene,
            4: Stage4Scene,
            5: Stage5Scene,
            6: Stage6Scene,
        };
    }

    loadStage(stageNumber) {
        // Avoid reloading the same stage
        if (stageNumber === this.currentStageNumber && this.currentStage !== null) {
            return;
        }

        // Cleanup the previous stage if it exists
        if (this.currentStage && typeof this.currentStage.cleanup === 'function') {
            try {
                this.currentStage.cleanup(this.scene);
            } catch (error) {
                console.error(`Error cleaning up stage ${this.currentStageNumber}:`, error);
            }
        } else if (this.currentStage) {
            console.warn(`Stage ${this.currentStageNumber} does not have a cleanup method.`);
        }
        this.currentStage = null; // Ensure reference is cleared after cleanup attempt

        // Load the new stage
        const StageConstructor = this.stageConstructors[stageNumber];

        if (StageConstructor) {
            try {
                console.log(`Initializing Stage ${stageNumber}...`);
                this.currentStage = new StageConstructor();
                if (typeof this.currentStage.init === 'function') {
                    this.currentStage.init(this.scene, this.camera, this.renderer);
                } else {
                    console.warn(`Stage ${stageNumber} object created but missing init method.`);
                }
                this.currentStageNumber = stageNumber;
                updateDescription(stageNumber); // Update the description text
            } catch (error) {
                console.error(`Error initializing stage ${stageNumber}:`, error);
                this.currentStage = null;
                this.currentStageNumber = -1;
                updateDescription(stageNumber); // Show default/error description
            }
        } else {
            console.warn(`Stage ${stageNumber} constructor not found.`);
            this.currentStage = null; // Explicitly clear stage
            this.currentStageNumber = stageNumber; // Keep track of attempted stage
            updateDescription(stageNumber); // Show default message
        }
    }

    update(deltaTime) {
        // Call the update function of the currently active stage
        if (this.currentStage && typeof this.currentStage.update === 'function') {
            try {
                this.currentStage.update(deltaTime);
            } catch (error) {
                console.error(`Error updating stage ${this.currentStageNumber}:`, error);
            }
        }
    }
}