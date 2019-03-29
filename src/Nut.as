package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	
	
	public class Nut extends Entity
	{
		
		private var image:Image;
		
		private var fly:Boolean = false;
		
		public function Nut():void
		{
			
			image = new Image(Assets.NUT_GRAPHIC);
			graphic = image;
			setHitbox(32, 32);
			type = "nut";
			super();
			
		}
		
		override public function update():void
		{
			
			if(!Preloader._paused){
			if (collide("squirrel", x, y)&&FlashPunkEngine.currentLevel.crystalScore == FlashPunkEngine.currentLevel.crystalsOnLevel)
			{
				FlashPunkEngine.currentLevel.remove(FlashPunkEngine.currentLevel.squirrelLink);
				//FlashPunkEngine.currentLevel.gameOver(1);
				fly = true;
				GameSound.rocketSound.play();
			}
			
			if (fly)
			{
				Tile.apocalypsis = true;
				this.y -= 1 + y/240;
			}
			
			if (y <= -32)
			{
				GameSound.rocketSound.stop();
				FlashPunkEngine.currentLevel.gameOver(1);
			}
			}
			
		}
		
	}
	
}