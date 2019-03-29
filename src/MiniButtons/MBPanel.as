package MiniButtons
{
	import net.flashpunk.Entity;
	
	
	
	public class MBPanel extends Entity
	{
		
		public static var pause:MBPause = new MBPause();
		public static var menu:MBMainMenu = new MBMainMenu();
		public static var restart:MBRestart = new MBRestart();
		public static var mute:MBMute = new MBMute(false);
		
		public static function showPanel():void
		{
			
			pause = new MBPause();
			menu = new MBMainMenu();
			restart = new MBRestart();
			Preloader.clientData.read();
			mute = new MBMute(Preloader.clientData.mute);
			
			pause.x = 0;
			menu.x = 24;
			restart.x = 48;
			mute.x = 72;
			
			FlashPunkEngine.currentLevel.add(pause);
			FlashPunkEngine.currentLevel.add(menu);
			FlashPunkEngine.currentLevel.add(restart);
			FlashPunkEngine.currentLevel.add(mute);
			
			
		}
		
		
		
	}
	
	
	
	
}