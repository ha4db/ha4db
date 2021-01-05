import * as THREE from 'three';
import { Ha4dbControls } from './Ha4dbControls';
import { TilesRenderer } from '3d-tiles-renderer';

// ... initialize three scene ...
const scene = new THREE.Scene();
const ambientLight = new THREE.AmbientLight(0xffffff, 1.0);
scene.add(ambientLight);
const camera = new THREE.PerspectiveCamera(70, window.innerWidth/window.innerHeight, 1, 2000);
camera.position.z = 0;
const renderer = new THREE.WebGLRenderer();
renderer.setPixelRatio(window.devicePixelRatio);
renderer.setSize(window.innerWidth, window.innerHeight);
document.querySelector('.pointcloud').appendChild(renderer.domElement)
const controls = new Ha4dbControls( camera, renderer.domElement );
controls.rotateSpeed = 1.0;
controls.zoomSpeed = 1.0;
controls.panSpeed = 1.0;

const tilesRenderer = new TilesRenderer( 'url' );
tilesRenderer.setCamera( camera );
tilesRenderer.setResolutionFromRenderer( camera, renderer );
scene.add( tilesRenderer.group );
const clock = new THREE.Clock();
renderLoop();

function renderLoop() {

	requestAnimationFrame( renderLoop );

	// The camera matrix is expected to be up to date
    // before calling tilesRenderer.update
    controls.update(clock.getDelta())
	camera.updateMatrixWorld();
	tilesRenderer.update();
    renderer.render( scene, camera );

}
