package
{
	import Levels.Level_0;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import splash.Splash;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	
	public class SniorCostil extends World
	{
		
		private var splashScreen:Splash;
		
		private var btNewGame:MenuButton;
		private var btChangeLevel:MenuButton;
		
		public function MainMenu():void
		{
			
			autoClear = true;
			
			//super();
			
		}
		
		override public function begin():void
		{
			
			addGraphic(Assets.MENU_BACKGROUND_GRAPHIC);
			
			btChangeLevel = new MenuButton(260, 128);
			btNewGame = new MenuButton(260, 96);
			
			add(btChangeLevel);
			add(btNewGame);
			
			
			super.begin();
			
		}
		
		override public function update():void
		{
			
			if (btNewGame.pressed)
			{
				
				FlashPunkEngine.changeWorld(Level_0);
				
			}
			super.update();
			
		}
		
		
	}
	
	
}