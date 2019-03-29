package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_21 extends Level
	{
		
		public function Level_21():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 21;
			levelOEL = Assets.LEVEL_21_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_20_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}