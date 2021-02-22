import * as THREE from 'three';
import {initView} from './lib/initView';
import {createRaycast} from './lib/raycaster';
import {makeInspectionLabel} from './lib/makeInspectionLabel';
import {PointInspection} from './lib/point_inspection';

const editInjury = (preview: boolean|null) => {
    const view = initView();
    if(!view) return;
    const pointPosition = document.getElementById('bridge_content_injury_pointposition') as HTMLInputElement
    if (pointPosition.value !== '') {
        const values = JSON.parse(pointPosition.value);
        view.controls.enabled = false;
        const inspectionPosition = new THREE.Vector3().fromArray(values.inspectionPosition)
        const cameraPosition = new THREE.Vector3().fromArray(values.cameraPosition);
        const inspectionText = (document.getElementById('bridge_content_injury_injury_type') as HTMLInputElement).value;
        makeInspectionLabel(view, inspectionText, inspectionPosition)
        view.camera.position.copy(cameraPosition);
        view.controls.setLatLon(values.cameraRotation);
        view.controls.enabled = true;
    }
    if (preview) {
      return
    }
    const updatePointPosition = (position: THREE.Vector3) => {
        const inspectionText = (document.getElementById('bridge_content_injury_injury_type') as HTMLInputElement).value;
        makeInspectionLabel(view, inspectionText, position);
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
export default editInjury;
