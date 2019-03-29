package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import net.flashpunk.FP;
	
	public class TutorialWindow extends Sprite
	{
		
		//private var okButton:Button = new Button("OK");
		private var tutorialTextField:TextField;
		public var tutorialText:String = "Lorem ipsum";
		private var destroyTimer:Timer;
		
		public function TutorialWindow():void
		{
			
			//super("");
			
			//addChild(okButton);
			
			
			this.scaleX = 1;	//splashMovie.width;
			this.scaleY = 1; //splashMovie.height;
			
			
			this.x = 240;
			this.y = 180;
			//this.rotationX = 120;
			
			//okButton.x = 190;
			//okButton.y = 130;
			//this.addEventListener(KeyboardEvent.KEY_DOWN, ok, false, 0, true);
			
		}
		
		private function ok(e:TimerEvent):void 
		{			//рестартит игру
			//FlashPunkEngine.currentLevel.end();
			//this.removeEventListener(KeyboardEvent.KEY_DOWN, ok);
			FP.stage.removeChild(this);
			//FP.engine.paused = false;
			//FlashPunkEngine.changeWorld(Level.levels[Level.currentLevelID]);
			Preloader.stageLink.focus = Preloader.currentFPE;
			
		}
		
		private function tick(e:TimerEvent):void
		{
			
			tutorialTextField.alpha -= 0.01;
			
		}
		
		public function showWindow():void
		{
			
			tutorialTextField = Tools.generateTextField(50, tutorialText, 0);
			tutorialTextField.alpha = 0.5;
			addChild(tutorialTextField);
			destroyTimer = new Timer(100, 50);
			destroyTimer.addEventListener(TimerEvent.TIMER_COMPLETE, ok, false, 0, true);
			destroyTimer.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			destroyTimer.start();
			FP.stage.addChild(this);
			
		}
		
		
	}
	
	
}