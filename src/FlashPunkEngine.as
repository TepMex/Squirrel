package
{
	import Levels.*;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import splash.Splash;
	
	
	
	public class FlashPunkEngine extends Engine
	{
		
		public static var currentWorld:World;
		public static var currentLevel:Level;
		private var IDlevel:int;
		private var cd:ClientData;
		
		public function FlashPunkEngine():void
		{
			
			super(Assets.APP_WIDTH, Assets.APP_HEIGHT);
			//FP.console.enable();
			Level.initLevels();
			cd = new ClientData();
			
			
		}
		
		override public function init():void
		{
			
			currentWorld = FP.world;
			super.init();
			
		}
		
		public static function changeWorld(world:Class):void
		{
			
			Preloader.currentFPE.visible = true;
			Preloader.currentMainMenu.visible = false;
			FP.engine.paused = false;
			FP.world = null;
			currentWorld = null;
			FP.world = new world();
			currentWorld = FP.world;
			
		}
		
	}
	
	
}