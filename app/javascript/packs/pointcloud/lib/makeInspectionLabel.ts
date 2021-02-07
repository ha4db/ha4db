import * as THREE from 'three';

let pastSprite = null;

// make sprite for inspection
function makeInspectionLabel(view, position: THREE.Vector3) {
	view.scene.remove(pastSprite);
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
	view.scene.add(sprite);
}
export {makeInspectionLabel}
