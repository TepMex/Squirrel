package
{
	import flash.events.MouseEvent;
	import net.flashpunk.FP;
	
	public class WinWindow extends PopupWindow
	{
		
		private var nextLevelButton:Button = new Button("NEXT");
		private var toMainButton:OrangeButton = new OrangeButton("main menu");
		
		public function WinWindow():void
		{
			
			super("YOU WIN!");
			
			addChild(nextLevelButton);
			addChild(toMainButton);
			
			
			
			this.scaleX = 1;	//splashMovie.width;
			this.scaleY = 1; //splashMovie.height;
			
			
			this.x = FP.screen.width / 2 - this.width / 2;
			this.y = 120;
			this.rotationX = 120;
			
			nextLevelButton.x = 190;
			nextLevelButton.y = 130;
			nextLevelButton.addEventListener(MouseEvent.MOUSE_DOWN, nextLevel, false, 0, true);
			
			toMainButton.x = 10;
			toMainButton.y = 130;
			toMainButton.addEventListener(MouseEvent.MOUSE_DOWN, toMain, false, 0, true);
			
		}
		
		private function nextLevel(e:MouseEvent):void 
		{			//рестартит игру
			FlashPunkEngine.currentLevel.end();
			nextLevelButton.removeEventListener(MouseEvent.MOUSE_DOWN, nextLevel);
			FP.stage.removeChild(this)
			FP.engine.paused = false
			Level.currentLevelID++;
			if (Level.currentLevelID > Preloader.clientData.lastOpenedLevel)
			{
				trace(1);
				Preloader.clientData.lastOpenedLevel = Level.currentLevelID;
				Preloader.clientData.record();
			}
			if (Level.currentLevelID < Level.levels.length)
			{
				//trace(Level.currentLevelID);
				//trace(Level.levels.length);
				FlashPunkEngine.changeWorld(Level.levels[Level.currentLevelID]);
				Preloader.stageLink.focus = Preloader.currentFPE;
			}
			else 
			{
				Level.currentLevelID = 0;
				MainMenu.currentPreloader.toMainMenu();
			}
			//Preloader.stageLink.focus = Preloader.currentFPE;
			
		}
		
		private function toMain(e:MouseEvent):void
		{
			if (Level.currentLevelID == Preloader.clientData.lastOpenedLevel)
			{
				trace(1);
				Preloader.clientData.lastOpenedLevel = Level.currentLevelID+1;
				Preloader.clientData.record();
			}
			toMainButton.removeEventListener(MouseEvent.MOUSE_DOWN, toMain);
			FP.stage.removeChild(this);
			MainMenu.currentPreloader.toMainMenu();
			
		}
		
		
	}
	
	
}