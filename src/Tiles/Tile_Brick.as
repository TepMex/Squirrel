package Tiles
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;

	
	
	public class Tile_Brick extends Tile
	{
		
		private var removeTimer:Timer;
		public static var removeDelay:int = 20;
		
		public function Tile_Brick():void
		{
			
			removeTimer = new Timer(50, Tile_Brick.removeDelay);
			removeTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onRemoveTimerComplete, false, 0, true);
			type = "tile";
			autoClear = true;
			spriteMap = new Spritemap(Assets.TILE_BRICK_GRAPHIC_CLASS, 32, 16);
			spriteMap.add("shine", [1], 4, true);
			spriteMap.add("common", [0], 2, true);
			super();
			spriteMap.play("common");
			
		}
		
		override public function update():void
		{
			
			if (!Preloader._paused) {
			if (Tile.apocalypsis)
			{
				falling = true;
			}
			if (collide("squirrel", x, y-1))
			{
				if (!removeTimer.running) 
				{ 
					GameSound.dropSound.play();
					spriteMap.play("shine");
					removeTimer.start();
				}
			}
			super.update();
			}
			else
			{
				if (removeTimer.running)
				{
					removeTimer.stop();
				}
			}
			
			if (falling)
			{
				y += FALLING_SPEED;
				if (collide("tile", x, y)||collide("squirrel",x,y) || y >= FP.screen.height + height)
				{
					FP.world.remove(this);
				}
			}
			
		}
		
		private function onRemoveTimerComplete(e:TimerEvent):void
		{
			
			removeTimer.stop();
			removeTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onRemoveTimerComplete);
			//FP.world.remove(this);
			falling = true;
			
		}
		
		
		
		
	}
	
	
}