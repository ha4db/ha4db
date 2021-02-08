import * as THREE from 'three';

let pastSprite = null;
let pastSphere = null;

// make sprite for inspection
function makeInspectionLabel(view, text, position: THREE.Vector3) {
	view.annotationScene.remove(pastSprite);
	view.annotationScene.remove(pastSphere);
	// initialize
	const canvasHeight = 100;
	const fontSize = 60;
	// create canvas
	const canvasForText = document.createElement('canvas');
	const ctx = canvasForText.getContext('2d');
	ctx.font = `${fontSize}px arial`;
	const textWidth = ctx.measureText(text).width;
	ctx.canvas.width = textWidth + 40;
	ctx.canvas.height = canvasHeight;
	ctx.fillStyle = 'rgba(0.2, 0.2, 0.2, 0.7)';
	ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
	ctx.fillStyle = 'white';
	ctx.font = `${fontSize}px arial`;
	ctx.fillText(
		text,
		(ctx.canvas.width - ctx.measureText(text).width) / 2,
		canvasHeight / 2 + ctx.measureText(text).actualBoundingBoxAscent / 2
	);
	// create texture
	const texture = new THREE.CanvasTexture(canvasForText);
	// create sprite
	const baseScale = 0.5;
	const spriteMaterial = new THREE.SpriteMaterial({ map: texture });
	const sprite = new THREE.Sprite(spriteMaterial);
	sprite.scale.set((ctx.canvas.width / ctx.canvas.height) * baseScale, baseScale, 1);
	sprite.center = new THREE.Vector2(0.0, 0.0);
	sprite.position.set(position.x, position.y, position.z);
	pastSprite = sprite;
	view.annotationScene.add(sprite);
	// create sphere
	const sphereGeometry = new THREE.SphereGeometry(0.1, 32, 32);
	const sphereMaterial = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
	const sphere = new THREE.Mesh(sphereGeometry, sphereMaterial);
	sphere.position.set(position.x, position.y, position.z);
	pastSphere = sphere;
	view.annotationScene.add(sphere);
}
export {makeInspectionLabel}
