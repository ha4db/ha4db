import * as THREE from 'three';
import { Ha4dbControls } from './Ha4dbControls';
import { TilesRenderer } from '3d-tiles-renderer';

// get data
const target = 'pointcloud'
const target_obj = document.getElementById(target)
const id:string = target_obj.dataset.id
const initialX = target_obj.dataset.originx
const initialY = target_obj.dataset.originy
const initialZ = target_obj.dataset.originz
const path = `/pointclouds/${id}/tiles/tileset.json`

// ... initialize three scene ...
const scene = new THREE.Scene();
const ambientLight = new THREE.AmbientLight(0xffffff, 1.0);
scene.add(ambientLight);
const camera = new THREE.PerspectiveCamera(70, window.innerWidth/window.innerHeight, 1, 2000);
camera.position.x = parseFloat(initialX);
camera.position.y = parseFloat(initialY);
camera.position.z = parseFloat(initialZ);
const renderer = new THREE.WebGLRenderer();
document.querySelector('#pointcloud').appendChild(renderer.domElement)
const dom = renderer.domElement;
renderer.setPixelRatio(window.devicePixelRatio);
renderer.setSize(dom.clientWidth, dom.clientHeight);
const controls = new Ha4dbControls( camera, dom );
controls.rotateSpeed = 1.0;
controls.zoomSpeed = 1.0;
controls.panSpeed = 1.0;

// initialize raycaster
const raycaster = new THREE.Raycaster();
document.addEventListener('click', raycast);
let pastSprite = null;

const tilesRenderer = new TilesRenderer( path );
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

// mouse click and raycast
function raycast(e) {
	const mouse = {
		x: (e.offsetX / dom.clientWidth) * 2 - 1,
		y: - (e.offsetY / dom.clientHeight) * 2 + 1
	};
	raycaster.setFromCamera( mouse, camera );
	const intersects = raycaster.intersectObject(tilesRenderer.group, true);

	if (intersects.length > 0) {
		makeInspectionLabel(intersects[0].point)
		return intersects[0];
	}
	else {
		return false;
	}
}

// make sprite for inspection
function makeInspectionLabel(position) {
	scene.remove(pastSprite);
	// initialize
	const canvasWidth = 50;
	const canvasHeight = 50;
	const fontSize = 40;
	const text = '点検箇所';
	// create canvas
	const canvasForText = document.createElement('canvas');
	const ctx = canvasForText.getContext('2d');
	ctx.canvas.width = canvasWidth;
	ctx.canvas.height = canvasHeight;
	ctx.fillStyle = 'rgba(255, 255, 255, 0.7)';
	ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
	ctx.fillStyle = 'black';
	ctx.font = `${fontSize}px`;
	ctx.fillText(
	  text,
	  (canvasWidth - ctx.measureText(text).width) / 2,
	  canvasHeight / 2 + ctx.measureText(text).actualBoundingBoxAscent / 2
	);
	// create texture
	const texture = new THREE.CanvasTexture(canvasForText);
	// create sprite
	const spriteMaterial = new THREE.SpriteMaterial({ map: texture });
	const sprite = new THREE.Sprite(spriteMaterial);
	sprite.scale.set(1, 1, 1);
	sprite.position.set(position.x, position.y, position.z);
	pastSprite = sprite;
	scene.add(sprite);
}