import * as THREE from 'three';
import {initView} from './lib/initView';
import {createRaycast} from './lib/raycaster';
import {makeInspectionLabel} from './lib/makeInspectionLabel';
import {PointInspection} from './lib/point_inspection';

const editInspection = () => {
    const view = initView();
    if(!view) return;
    const pointPosition = document.getElementById('bridge_content_inspection_pointposition') as HTMLInputElement
    if(!pointPosition) return;
    view.controls.enabled = false;
    const values: PointInspection = JSON.parse(pointPosition.value);
    console.log(pointPosition.value);
    const inspectionPosition = new THREE.Vector3().fromArray(values.inspectionPosition)
    const cameraPosition = new THREE.Vector3().fromArray(values.cameraPosition);
    makeInspectionLabel(view, inspectionPosition)
    view.camera.position.copy(cameraPosition);
    view.controls.setLatLon(values.cameraRotation);
    view.controls.enabled = true;
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
    view.dom.addEventListener('click', raycast);
}
editInspection();
