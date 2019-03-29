package
{
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	
	public class Spring extends Entity
	{
		
		private var image:Image;
		private var spriteMap:Spritemap = new Spritemap(Assets.SPRING_GRAPHIC, 16, 16);
		
		public function Spring():void
		{
			
			//image = new Image(Assets.SPRING_GRAPHIC);
			//graphic = image;
			graphic = spriteMap;
			spriteMap.add("anim", [0, 1, 2, 3], 10, true);
			
			setHitbox(spriteMap.width, spriteMap.height);
			type = "Spring";
			super();
			
		}
		
		
		override public function update():void
		{
			if(!Preloader._paused){
			spriteMap.play("anim");
			if (collide("squirrel", x, y))
			{
				
				//FlashPunkEngine.currentLevel.crystalScore++;
				GameSound.springSound.play();
				//FP.world.remove(this);
				Assets.JUMP_POWER = 1;
				gravity = -1;
				
			}
			}
		}
		
		
	}
	
	
}