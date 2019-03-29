package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_1 extends Level
	{
		
		public function Level_1():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 1;
			levelOEL = Assets.LEVEL_1_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_0_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}