package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_6 extends Level
	{
		
		public function Level_6():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 6;
			levelOEL = Assets.LEVEL_6_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_5_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}