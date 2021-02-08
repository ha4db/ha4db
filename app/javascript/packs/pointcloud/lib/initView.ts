import * as THREE from 'three';
import { Ha4dbControls } from './Ha4dbControls';
import { TilesRenderer } from '3d-tiles-renderer';

// ... initialize three scene ...
function initView() {
	// get data
	const target = 'pointcloud'
	const target_obj = document.getElementById(target)
	if(!target_obj) return false;
	const id: string = target_obj.dataset.id
	const initialX = target_obj.dataset.originx
	const initialY = target_obj.dataset.originy
	const initialZ = target_obj.dataset.originz
	const path = `/pointclouds/${id}/tiles/tileset.json`
	// make scene
	const scene = new THREE.Scene();
	const ambientLight = new THREE.AmbientLight(0xffffff, 1.0);
	scene.add(ambientLight);
	// make scene for annotation
	const annotationScene = new THREE.Scene();
	const anotambientLight = new THREE.AmbientLight(0xffffff, 1.0);
	annotationScene.add(anotambientLight);
	// make camera
	const camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 1, 2000);
	camera.position.x = parseFloat(initialX);
	camera.position.y = parseFloat(initialY);
	camera.position.z = parseFloat(initialZ);
	// make renderer and attach to dom
	const renderer = new THREE.WebGLRenderer();
	const div = document.querySelector('#pointcloud');
	div.appendChild(renderer.domElement);
	renderer.domElement.width = div.clientWidth * window.devicePixelRatio;
	renderer.domElement.height = div.clientHeight * window.devicePixelRatio;
	renderer.domElement.style.width = div.clientWidth + 'px';
	renderer.domElement.style.height = div.clientHeight + 'px';
	const dom = renderer.domElement;
	renderer.setPixelRatio(window.devicePixelRatio);
	renderer.setSize(dom.clientWidth, dom.clientHeight);
	renderer.autoClear = false;
	// init 3D tiles renderer
	const tilesRenderer = new TilesRenderer(path);
	tilesRenderer.setCamera(camera);
	tilesRenderer.setResolutionFromRenderer(camera, renderer);
	scene.add(tilesRenderer.group);
	const clock = new THREE.Clock();
	// attach control
	const controls = new Ha4dbControls(camera, dom);
	controls.rotateSpeed = 1.0;
	controls.zoomSpeed = 1.0;
	controls.panSpeed = 1.0;
	function renderLoop() {

		requestAnimationFrame(renderLoop);

		// The camera matrix is expected to be up to date
		// before calling tilesRenderer.update
		renderer.setClearColor(0xffffff, 1);
		controls.update(clock.getDelta())
		camera.updateMatrixWorld();
		tilesRenderer.update();
		renderer.clear();
		renderer.render(scene, camera);
		renderer.clearDepth();
		renderer.render(annotationScene, camera);

	}
	renderLoop();
	return ({
		dom: dom,
		camera: camera,
		scene: scene,
		annotationScene: annotationScene,
		controls: controls,
		points: tilesRenderer.group
	});
}
export {initView};
