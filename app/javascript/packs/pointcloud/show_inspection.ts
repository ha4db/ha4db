import * as THREE from 'three';
import {initView} from './lib/initView';
import {makeInspectionLabel} from './lib/makeInspectionLabel';
import {PointInspection} from './lib/point_inspection';

const showInspection = () => {
    const view = initView();
    if(!view) return;
    view.controls.enabled = false;
    const pointPosition = document.getElementById('bridge_content_inspection_pointposition') as HTMLInputElement
    const values: PointInspection = JSON.parse(pointPosition.value);
    console.log(pointPosition.value);
    const inspectionPosition = new THREE.Vector3().fromArray(values.inspectionPosition)
    const cameraPosition = new THREE.Vector3().fromArray(values.cameraPosition);
    makeInspectionLabel(view, inspectionPosition)
    view.camera.position.copy(cameraPosition);
    view.controls.setLatLon(values.cameraRotation);
    view.controls.enabled = true;
}
showInspection();
