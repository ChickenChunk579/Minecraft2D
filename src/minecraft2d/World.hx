package minecraft2d;
import openfl.Lib;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.display.Sprite;

class World extends Sprite {
    public var tilemap: Tilemap;
    
    public function new() {
        super();

        tilemap = new Tilemap(16384, 4096, Registry.tileset);
        tilemap.tileAlphaEnabled = false;
		tilemap.tileBlendModeEnabled = false;
		tilemap.tileColorTransformEnabled = false;
        tilemap.scaleX = 2.0;
        tilemap.scaleY = 2.0;
        addChild(tilemap);
    }

    public function setBlock(x: Int, y: Int, name: String) {
        var tile = new Tile(Registry.blocksMap[name], x * 16, y * 16);
        tilemap.addTile(tile);
    }
}