package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_3 extends Level
	{
		
		public function Level_3():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 3;
			levelOEL = Assets.LEVEL_3_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_0_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}