package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_23 extends Level
	{
		
		public function Level_23():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 23;
			levelOEL = Assets.LEVEL_23_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_20_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}