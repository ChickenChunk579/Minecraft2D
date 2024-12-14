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

	public function new() {
		super();
		Registry.registerAllBlocks();

		world = new World();

		addChild(world);
	}
}