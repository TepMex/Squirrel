package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_2 extends Level
	{
		
		public function Level_2():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 2;
			levelOEL = Assets.LEVEL_2_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_1_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}