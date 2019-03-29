package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_19 extends Level
	{
		
		public function Level_19():void
		{
			
			destoyTime = 20;
			bronzeWin = 2;
			silverWin = 4;
			
			id = 19;
			levelOEL = Assets.LEVEL_19_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_15_BACK);
			
			super();
			
		}
		
		override public function begin():void
		{
			
			super.begin();
			
		}
		
	}
	
	
}