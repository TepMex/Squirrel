package
{
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import net.flashpunk.FP;
	import flash.net.*;
	
	public class GameOverWindow extends PopupWindow
	{
		
		private var restartButton:Button = new Button("restart");
		private var walkthroughButton:OrangeButton = new OrangeButton("walkthrough");
		
		public function GameOverWindow():void
		{
			
			super("GAME OVER");
			
			addChild(restartButton);
			//addChild(walkthroughButton);
			
			
			
			this.scaleX = 1;	//splashMovie.width;
			this.scaleY = 1; //splashMovie.height;
			
			
			this.x = FP.screen.width / 2 - this.width / 2;
			this.y = 120;
			this.rotationX = 120;
			
			restartButton.x = 190;
			restartButton.y = 130;
			restartButton.addEventListener(MouseEvent.MOUSE_DOWN, restartGame, false, 0, true);
			
			walkthroughButton.x = 10;
			walkthroughButton.y = 130;
			walkthroughButton.addEventListener(MouseEvent.MOUSE_DOWN, toWalkthrough, false, 0, true);
			
		}
		
		private function restartGame(e:MouseEvent):void 
		{			//рестартит игру
			FlashPunkEngine.currentLevel.end();
			restartButton.removeEventListener(MouseEvent.MOUSE_DOWN, restartGame);
			FP.stage.removeChild(this)
			FP.engine.paused = false
			FlashPunkEngine.changeWorld(Level.levels[Level.currentLevelID]);
			Preloader.stageLink.focus = Preloader.currentFPE;
			
		}
		
		private function toWalkthrough(e:MouseEvent):void
		{
			navigateToURL(new URLRequest(Assets.WALKT_URL));
			//walkthroughButton.removeEventListener(MouseEvent.MOUSE_DOWN, toWalkthrough);
			//FP.stage.removeChild(this);
			//MainMenu.currentPreloader.toMainMenu();
			//trace(1);
			
		}
		
		
	}
	
	
}