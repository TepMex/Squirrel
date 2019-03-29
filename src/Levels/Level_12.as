package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_12 extends Level
	{
		
		public function Level_12():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 12;
			levelOEL = Assets.LEVEL_12_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_10_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}