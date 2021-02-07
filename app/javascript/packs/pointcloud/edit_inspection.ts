import {initView} from './lib/initView';
import {createRaycast} from './lib/raycaster';
import {makeInspectionLabel} from './lib/makeInspectionLabel';
import {PointInspection} from './lib/point_inspection';

const editInspection = () => {
    const view = initView();
    if(!view) return;
    const pointPosition = document.getElementById('bridge_content_inspection_pointposition') as HTMLInputElement
    const updatePointPosition = (position: THREE.Vector3) => {
        makeInspectionLabel(view, position);
        const values: PointInspection = {
            cameraPosition: view.camera.position.toArray(),
            cameraRotation: view.controls.getLatLon(),
            inspectionPosition: position.toArray()
        }
        pointPosition.value = JSON.stringify(values);
    }
    const raycast = createRaycast(view, updatePointPosition);
    document.addEventListener('click', raycast);    
}
editInspection();
