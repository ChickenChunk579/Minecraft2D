import feathers.controls.ButtonState;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import minecraft2d.Camera;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.events.EventType;
import openfl.display.FPS;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.display.Sprite;
import feathers.controls.Application;
import feathers.controls.Button;
import feathers.controls.TextCallout;
import feathers.events.TriggerEvent;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import minecraft2d.World;
import minecraft2d.Registry;

// the Application component automatically scales the project to an appropriate
// size for any type of device, from mobile to desktop.
// using this component is optional. Feathers UI components may be added as
// children of any OpenFL display object.
class Main extends Sprite {
	public var world : World;

	public final speed = 2;

	public function new() {
		super();
		Registry.init();
		Registry.registerAllBlocks();

		world = new World();
		world.setBlock(0, 0, "dirt");

		addChild(world);

		var fps = new FPS();
		addChild(fps);
		
		var hudContainer = new LayoutGroup();
		#if (ios || android)
		var upButton = new Button(" ", function(e: TriggerEvent) {});
		upButton.width = 75;
		upButton.height = 75;
		upButton.x = 85;
		upButton.y = stage.stageHeight - 245;
		hudContainer.addChild(upButton);

		var downButton = new Button(" ", function(e: TriggerEvent) {});
		downButton.width = 75;
		downButton.height = 75;
		downButton.x = 85;
		downButton.y = stage.stageHeight - 85;
		hudContainer.addChild(downButton);

		var leftButton = new Button(" ", function(e: TriggerEvent) {});
		leftButton.width = 75;
		leftButton.height = 75;
		leftButton.x = 10;
		leftButton.y = stage.stageHeight - 165;
		hudContainer.addChild(leftButton);

		var rightButton = new Button(" ", function(e: TriggerEvent) {});
		rightButton.width = 75;
		rightButton.height = 75;
		rightButton.x = 160;
		rightButton.y = stage.stageHeight - 165;
		hudContainer.addChild(rightButton);
		#end
		addChild(hudContainer);

		var up = false;
		var down = false;
		var left = false;
		var right = false;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e: KeyboardEvent) {
			if (e.keyCode == Keyboard.UP) {
				up = true;
			}
			if (e.keyCode == Keyboard.DOWN) {
				down = true;
			}
			if (e.keyCode == Keyboard.LEFT) {
				left = true;
			}
			if (e.keyCode == Keyboard.RIGHT) {
				right = true;
			}
		});
		stage.addEventListener(KeyboardEvent.KEY_UP, function(e: KeyboardEvent) {
			if (e.keyCode == Keyboard.UP) {
				up = false;
			}
			if (e.keyCode == Keyboard.DOWN) {
				down = false;
			}
			if (e.keyCode == Keyboard.LEFT) {
				left = false;
			}
			if (e.keyCode == Keyboard.RIGHT) {
				right = false;
			}
		});
		stage.addEventListener(Event.ENTER_FRAME, function(e: Event) {
			#if (ios || android)
			upButton.x = 85;
			upButton.y = stage.stageHeight - 245;

			downButton.x = 85;
			downButton.y = stage.stageHeight - 85;

			leftButton.x = 10;
			leftButton.y = stage.stageHeight - 165;

			rightButton.x = 160;
			rightButton.y = stage.stageHeight - 165;

			if (upButton.currentState == ButtonState.DOWN) {
				up = true;
			} else {
				up = false;
			}

			if (downButton.currentState == ButtonState.DOWN) {
				down = true;
			} else {
				down = false;
			}

			if (leftButton.currentState == ButtonState.DOWN) {
				left = true;
			} else {
				left = false;
			}

			if (rightButton.currentState == ButtonState.DOWN) {
				right = true;
			} else {
				right = false;
			}
			#end

			if (up) {
				Camera.y += speed;
			}
			if (down) {
				Camera.y -= speed;
			}
			if (left) {
				Camera.x -= speed;
			}
			if (right) {
				Camera.x += speed;
			}
			
			world.tilemap.x = -Camera.x;
			world.tilemap.y = Camera.y;
		});
	}
}