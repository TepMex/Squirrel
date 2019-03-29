package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_22 extends Level
	{
		
		public function Level_22():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 22;
			levelOEL = Assets.LEVEL_22_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_20_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}