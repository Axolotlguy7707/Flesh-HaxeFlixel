package;

import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxTile;
import flixel.FlxState;
import objects.Player;
import flixel.FlxG;

class PlayState extends FlxState
{

	var player:Player;

	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;

	override public function create()
	{
		super.create();


		map = new FlxOgmo3Loader(AssetPaths.Flesh__ogmo, AssetPaths.testlevel__json);
		walls = map.loadTilemap(AssetPaths.tree__png, "Walls");
		//walls.follow();
		walls.setTileProperties(0, NONE);
		add(walls);
		//FlxG.camera.bgColor = 0xFF00FF00;

		player = new Player(0, 0);
		map.loadEntities(placeEntities, "Entities");

		add(player);
	}

		function placeEntities(entity:EntityData)
		{
			if (entity.name == "Player")
			{	
				player.setPosition(entity.x, entity.y);
			}
		}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
		FlxG.camera.follow(player);
	}
}
