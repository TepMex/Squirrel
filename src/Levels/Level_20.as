package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_20 extends Level
	{
		
		public function Level_20():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 20;
			levelOEL = Assets.LEVEL_20_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_20_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}