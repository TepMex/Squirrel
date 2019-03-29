package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_16 extends Level
	{
		
		public function Level_16():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 16;
			levelOEL = Assets.LEVEL_16_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_15_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}