package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_13 extends Level
	{
		
		public function Level_13():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 13;
			levelOEL = Assets.LEVEL_13_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_10_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}