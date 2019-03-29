package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_18 extends Level
	{
		
		public function Level_18():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 18;
			levelOEL = Assets.LEVEL_18_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_15_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}