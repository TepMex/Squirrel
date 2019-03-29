package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_14 extends Level
	{
		
		public function Level_14():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 14;
			levelOEL = Assets.LEVEL_14_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_10_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}