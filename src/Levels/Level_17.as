package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_17 extends Level
	{
		
		public function Level_17():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 17;
			levelOEL = Assets.LEVEL_17_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_15_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}