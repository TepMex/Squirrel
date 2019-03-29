package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_11 extends Level
	{
		
		public function Level_11():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 11;
			levelOEL = Assets.LEVEL_11_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_10_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}