package
{
	import com.greensock.TimelineLite;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.media.Video;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.StageScaleMode;
	import flash.ui.MouseCursor;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import net.flashpunk.FP;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.events.AsyncErrorEvent;
	import flash.net.NetStream;
	import flash.utils.ByteArray;
	
	
	public class Preloader extends Sprite
	{
		
		private var progressText:TextField = new TextField();
		private var progress:int = 0;
		
		public static var _paused:Boolean = false;
		
		public static var stageLink:Stage;
		public static var currentMainMenu:MainMenu;
		public static var currentFPE:FlashPunkEngine;
		public static var clientData:ClientData = new ClientData();
		
		public function Preloader():void
		{
			
			
			
			super();
			
			
			
			if (currentMainMenu == null)
			{
				currentMainMenu = new MainMenu();
			}
			
			stageLink = stage;
			
			
			buttonMode = true;
			
			stage.showDefaultContextMenu = false;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.tabChildren = false;
			stage.stageFocusRect = false;
			stage.focus = stage;
			stage.quality = "high";
			
			var progressTextFormat:TextFormat = new TextFormat();
			progressTextFormat.size = 64;
			progressTextFormat.color = 0xffffff;
			progressTextFormat.bold = true;
			progressText.selectable = false;
			
			
			progressText.width = 250;
			progressText.defaultTextFormat = progressTextFormat;
			progressText.text = progress + "%";
			progressText.x = stage.width/2 - progressText.width / 2;
			progressText.y = stage.height/2 - progressText.height / 2;
			
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress, false, 0, true);
			loaderInfo.addEventListener(Event.COMPLETE, onComplete, false, 0, true);
			
			
			if (Preloader.currentFPE == null)
			{
				Preloader.currentFPE = new FlashPunkEngine();
				Preloader.currentFPE.visible = false;
				Preloader.stageLink.addChild(Preloader.currentFPE);
			}
			
		}
		
		private function onProgress(e:ProgressEvent):void
		{
			
			progress = int((e.bytesLoaded / e.bytesTotal) * 100);
			progressText.text = progress + "%";
			
		}
		
		private function onComplete(e:Event):void
		{
			
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			
			/*progressText.text = "START!";
			progressText.addEventListener(MouseEvent.CLICK, onClickStart, false, 0, true);
			progressText.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
			progressText.addEventListener(MouseEvent.MOUSE_DOWN, onMousePress, false, 0, true);
			progressText.addEventListener(MouseEvent.MOUSE_UP, onMouseRelease, false, 0, true);
			progressText.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);*/
			
			
			progressText.removeEventListener(MouseEvent.CLICK, onClickStart);
			MainMenu.currentPreloader = this;
			Preloader.currentMainMenu.visible = false;
			Preloader.stageLink.addChild(Preloader.currentMainMenu);
			clientData.read();
			
			stageLink.addChild(new IntroVideo(stageLink,this));
			
			
		}
		
		private function onClickStart(e:MouseEvent):void
		{
			
			
			progressText.removeEventListener(MouseEvent.CLICK, onClickStart);
			MainMenu.currentPreloader = this;
			Preloader.stageLink.addChild(Preloader.currentMainMenu);
			clientData.read();
			
		}
		
		private function onMouseOver(e:MouseEvent):void
		{
			
			progressText.textColor = 0x999999;
			Mouse.cursor = MouseCursor.HAND;
			
		}
		
		private function onMouseOut(e:MouseEvent):void
		{
			
			progressText.textColor = 0xffffff;
			Mouse.cursor = MouseCursor.ARROW;
			
		}
		
		private function onMousePress(e:MouseEvent):void
		{
			
			progressText.textColor = 0xcccccc;
			
		}
		
		private function onMouseRelease(e:MouseEvent):void
		{
			
			progressText.textColor = 0x999999;
			
		}
		
		public function toMainMenu():void
		{
			
			clientData.record();
			clientData.read();
			//MainMenu.currentLevelChange = new LevelChange();
			if (Preloader.currentMainMenu.contains(MainMenu.currentLevelChange))
			{
				Preloader.currentMainMenu.removeChild(MainMenu.currentLevelChange);
			}
			if (Preloader.currentMainMenu.contains(MainMenu.currentCredits))
			{
				Preloader.currentMainMenu.removeChild(MainMenu.currentCredits);
			}
			if (Preloader.currentMainMenu.contains(MainMenu.currentAuthors))
			{
				Preloader.currentMainMenu.removeChild(MainMenu.currentAuthors);
			}
			Preloader.currentFPE.visible = false;
			Preloader.currentMainMenu.visible = true;
			
			FP.engine.paused = true;
		}
		
		public function introComplete():void
		{
			Preloader.currentMainMenu.visible = true;
		}
		
		
	}
	
	
}