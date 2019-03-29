package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_15 extends Level
	{
		
		public function Level_15():void
		{
			
			destoyTime = 5;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 15;
			levelOEL = Assets.LEVEL_15_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_15_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}