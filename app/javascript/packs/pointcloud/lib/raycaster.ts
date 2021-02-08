import * as THREE from 'three';
import { initView } from './initView';

const raycaster = new THREE.Raycaster();

// mouse click and raycast
function createRaycast(view, callback) {
    return function(e: MouseEvent) {
        const mouse = {
            x: (e.offsetX / view.dom.clientWidth) * 2 - 1,
            y: - (e.offsetY / view.dom.clientHeight) * 2 + 1
        };
        raycaster.setFromCamera(mouse, view.camera);
        const intersects = raycaster.intersectObject(view.points, true);
    
        if (intersects.length > 0) {
            //makeInspectionLabel(intersects[0].point)
            callback(intersects[0].point);
        }
        else {
            return false;
        }
    }
    
}

export {
    createRaycast
}