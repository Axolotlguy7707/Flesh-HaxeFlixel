package objects;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;


class Player extends FlxSprite
{

    var Speed:Float;

    public function new(x:Float, y:Float)
    {
        super(x, y);
        this.frames = FlxAtlasFrames.fromSparrow("assets/images/Player.png", "assets/images/Player.xml");
        this.animation.addByPrefix("idle", "idle", 30, false, false, false);
        this.animation.addByPrefix("walk", "walk", 15, true, false, false);
        this.scale.set(0.6, 0.6);
        Speed = 5;
    }


    override public function update(elapsed:Float):Void
    {

        super.update(elapsed);

        if (FlxG.keys.pressed.A)
        {
            x += -Speed;
            this.flipX = true;
        }
        if (FlxG.keys.pressed.D)
        {
            x += Speed;
            this.flipX = false;
        }
        if (FlxG.keys.pressed.W)
        {
            y += -Speed;
        }
        if (FlxG.keys.pressed.S)
        {
            y += Speed;
        }

        if (FlxG.keys.pressed.W == false && FlxG.keys.pressed.A == false && FlxG.keys.pressed.S == false && FlxG.keys.pressed.D == false)
        {
            this.animation.play("idle");
        } else
        {
            this.animation.play("walk");
        }
    }
}