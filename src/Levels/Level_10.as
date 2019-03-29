package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_10 extends Level
	{
		
		public function Level_10():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 10;
			levelOEL = Assets.LEVEL_10_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_10_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}