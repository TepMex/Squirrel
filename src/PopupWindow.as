package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.StageScaleMode;
	import flash.ui.MouseCursor;
	import flash.ui.Mouse;
	import net.flashpunk.FP;
	import com.greensock.TweenLite;
	import com.greensock.easing.Elastic;
	
	
	public class PopupWindow extends Sprite
	{
		
		public var windowText:TextField;
		
		public function PopupWindow(wtext:String):void
		{
			
			
			super();
			
			windowText = Tools.generateTextField(45, wtext, 0x666666);
			windowText.x = 40;
			windowText.y = 20;
			addChild(new Assets.POPUP_WINDOW_GRAPHIC_CLASS);
			addChild(windowText);
			
		}
		
		public function showWindow():void
		{
			GameSound.popupSound.play();
			FP.engine.paused = true
			FP.stage.addChild(this);
			TweenLite.to(this, 5, {rotationX: 0, ease: Elastic.easeOut});
			
		}
		
	}
}