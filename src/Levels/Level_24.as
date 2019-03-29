package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_24 extends Level
	{
		
		public function Level_24():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 24;
			levelOEL = Assets.LEVEL_24_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_20_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}