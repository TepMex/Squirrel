package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_9 extends Level
	{
		
		public function Level_9():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 9;
			levelOEL = Assets.LEVEL_9_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_5_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}