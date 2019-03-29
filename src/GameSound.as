package
{
	import net.flashpunk.Sfx;
	
	public class GameSound
	{
		
		
		//SOUNDS
		[Embed(source = "../content/sound/spawn.mp3")] private static const SPAWN_SOUND_CLASS:Class;
		public static var spawnSound:Sfx = new Sfx(SPAWN_SOUND_CLASS);
		[Embed(source = "../content/sound/RocketStart.mp3")] private static const ROCKET_SOUND_CLASS:Class;
		public static var rocketSound:Sfx = new Sfx(ROCKET_SOUND_CLASS);
		[Embed(source = "../content/sound/Drop.mp3")] private static const DROP_SOUND_CLASS:Class;
		public static var dropSound:Sfx = new Sfx(DROP_SOUND_CLASS);
		[Embed(source = "../content/sound/Crystal.mp3")] private static const CRYSTAL_SOUND_CLASS:Class;
		public static var crystalSound:Sfx = new Sfx(CRYSTAL_SOUND_CLASS);
		[Embed(source = "../content/sound/Jump.mp3")] private static const JUMP_SOUND_CLASS:Class;
		public static var jumpSound:Sfx = new Sfx(JUMP_SOUND_CLASS);
		[Embed(source = "../content/sound/Popup.mp3")] private static const POPUP_SOUND_CLASS:Class;
		public static var popupSound:Sfx = new Sfx(POPUP_SOUND_CLASS);
		[Embed(source = "../content/sound/Die.mp3")] private static const DIE_SOUND_CLASS:Class;
		public static var dieSound:Sfx = new Sfx(DIE_SOUND_CLASS);
		
		
	}
	
	
}