package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_7 extends Level
	{
		
		public function Level_7():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 7;
			levelOEL = Assets.LEVEL_7_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_5_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}