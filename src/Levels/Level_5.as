package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_5 extends Level
	{
		
		public function Level_5():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 5;
			levelOEL = Assets.LEVEL_5_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_5_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}