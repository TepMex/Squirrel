package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_4 extends Level
	{
		
		public function Level_4():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 4;
			levelOEL = Assets.LEVEL_4_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_0_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}