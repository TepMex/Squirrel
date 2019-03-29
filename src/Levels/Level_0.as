package Levels
{
	import net.flashpunk.graphics.Image;
	
	
	public class Level_0 extends Level
	{
		
		public function Level_0():void
		{
			
			id = 0;
			
			
			
			levelOEL = Assets.LEVEL_0_OEL;
			backgroundGraphic = new Image(Assets.LEVEL_0_BACK);
			
			super();
			//tutorialWindow.tutorialText = "LEVEL 0";
			
		}
		
		override public function begin():void
		{
			
			
			super.begin();
			
		}
		
	}
	
	
}