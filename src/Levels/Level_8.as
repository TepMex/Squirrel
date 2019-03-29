package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_8 extends Level
	{
		
		public function Level_8():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 8;
			levelOEL = Assets.LEVEL_8_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_5_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}