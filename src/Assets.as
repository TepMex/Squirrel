package
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	
	
	public class Assets
	{
		
		//IMAGES
		[Embed(source = "../content/img/preloader.jpg")] public static const PRELOADER_IMAGE:Class;
		[Embed(source = "../content/img/ball32_2.png")] public static const NUT_GRAPHIC:Class;
		[Embed(source = "../content/img/hero16x32.png")] public static const SQUIRREL_GRAPHIC:Class;
		[Embed(source = "../content/img/crystal16.png")] public static const CRYSTAL_GRAPHIC:Class;
		
		[Embed(source = "../content/img/spring.png")] public static const SPRING_GRAPHIC:Class;
		
		[Embed(source = "../content/img/portal_in.png")] public static const PORTALIN_GRAPHIC:Class;
		[Embed(source = "../content/img/portal_out.png")] public static const PORTALOUT_GRAPHIC:Class;
		
		[Embed(source = "../content/img/menu_backgr.png")] public static const MENU_BACKGROUND_IMAGE:Class;
		[Embed(source = "../content/img/ButtonImage.png")] public static const MENU_BUTTON_IMAGE:Class;
		[Embed(source = "../content/img/OrangeButtonImage.png")] public static const ORANGE_BUTTON_IMAGE:Class;
		[Embed(source = "../content/img/GreenLevelChangeButton.png")] public static const GREENLC_BUTTON_IMAGE:Class;
		[Embed(source = "../content/img/RedLevelChangeButton.png")] public static const REDLC_BUTTON_IMAGE:Class;
		[Embed(source = "../content/img/GameLogo.png")] public static const GAME_LOGO_IMAGE:Class;
		
		
		//MINI BUTTONS
		[Embed(source = "../content/img/MiniButton_pause.png")] public static const MBPAUSE_IMAGE:Class;
		[Embed(source = "../content/img/MiniButton_mainmenu.png")] public static const MBMAINMENU_IMAGE:Class;
		[Embed(source = "../content/img/MiniButton_mute.png")] public static const MBMUTE_IMAGE:Class;
		[Embed(source = "../content/img/MiniButton_restart.png")] public static const MBRESTART_IMAGE:Class;
		
		[Embed(source = "../content/img/popup_window.png")] public static const POPUP_WINDOW_GRAPHIC_CLASS:Class;

		[Embed(source = "../content/img/menu_backgr.png")] private static const MENU_BACKGROUND_GRAPHIC_CLASS:Class;
		public static const MENU_BACKGROUND_GRAPHIC:Image = new Image(MENU_BACKGROUND_GRAPHIC_CLASS);
		
		[Embed(source = "../content/img/menu_pointer16x32.png")] public static const MENU_POINTER_GRAPHIC_CLASS:Class;
		public static const MENU_POINTER_GRAPHIC:Image = new Image(MENU_POINTER_GRAPHIC_CLASS);
		
		//LEVEL BACKGROUNDS
		[Embed(source = "../content/img/level_0_back.png")] public static const LEVEL_0_BACK:Class;
		public static const LEVEL_1_BACK:Class = LEVEL_0_BACK;
		[Embed(source = "../content/img/level_1_back.png")] public static const LEVEL_5_BACK:Class;
		[Embed(source = "../content/img/level_2_back.png")] public static const LEVEL_10_BACK:Class;
		[Embed(source = "../content/img/level_3_back.png")] public static const LEVEL_15_BACK:Class;
		[Embed(source = "../content/img/level_4_back.png")] public static const LEVEL_20_BACK:Class;
		//TILESETS AND TILES
		[Embed(source = "../content/img/fball_tileset_32.png")] public static const TILESET_GRAPHIC:Class;
		
		[Embed(source = "../content/img/brick32.png")] public static const TILE_BRICK_GRAPHIC_CLASS:Class;
		[Embed(source = "../content/img/metal32.png")] public static const TILE_METAL_GRAPHIC_CLASS:Class;
		[Embed(source = "../content/img/stone32.png")] public static const TILE_STONE_GRAPHIC_CLASS:Class;
		
		[Embed(source = "../content/video/intro.flv", mimeType = "application/octet-stream")] public static const VIDEO_INTRO:Class;
		
		public static const TILE_BRICK_GRAPHIC:Image = new Image(TILE_BRICK_GRAPHIC_CLASS);
		public static const TILE_METAL_GRAPHIC:Image = new Image(TILE_METAL_GRAPHIC_CLASS);
		public static const TILE_STONE_GRAPHIC:Image = new Image(TILE_STONE_GRAPHIC_CLASS);
		
		//OEL LEVELS
		[Embed(source = "../content/xml/Level_0.oel", mimeType = "application/octet-stream")] public static const LEVEL_0_OEL:Class;
		[Embed(source = "../content/xml/Level_1.oel", mimeType = "application/octet-stream")] public static const LEVEL_1_OEL:Class;
		[Embed(source = "../content/xml/Level_2.oel", mimeType = "application/octet-stream")] public static const LEVEL_2_OEL:Class;
		[Embed(source = "../content/xml/Level_3.oel", mimeType = "application/octet-stream")] public static const LEVEL_3_OEL:Class;
		[Embed(source = "../content/xml/Level_4.oel", mimeType = "application/octet-stream")] public static const LEVEL_4_OEL:Class;
		[Embed(source = "../content/xml/Level_5.oel", mimeType = "application/octet-stream")] public static const LEVEL_5_OEL:Class;
		[Embed(source = "../content/xml/Level_6.oel", mimeType = "application/octet-stream")] public static const LEVEL_6_OEL:Class;
		[Embed(source = "../content/xml/Level_7.oel", mimeType = "application/octet-stream")] public static const LEVEL_7_OEL:Class;
		[Embed(source = "../content/xml/Level_8.oel", mimeType = "application/octet-stream")] public static const LEVEL_8_OEL:Class;
		[Embed(source = "../content/xml/Level_9.oel", mimeType = "application/octet-stream")] public static const LEVEL_9_OEL:Class;
		[Embed(source = "../content/xml/Level_10.oel", mimeType = "application/octet-stream")] public static const LEVEL_10_OEL:Class;
		[Embed(source = "../content/xml/Level_11.oel", mimeType = "application/octet-stream")] public static const LEVEL_11_OEL:Class;
		[Embed(source = "../content/xml/Level_12.oel", mimeType = "application/octet-stream")] public static const LEVEL_12_OEL:Class;
		[Embed(source = "../content/xml/Level_13.oel", mimeType = "application/octet-stream")] public static const LEVEL_13_OEL:Class;
		[Embed(source = "../content/xml/Level_14.oel", mimeType = "application/octet-stream")] public static const LEVEL_14_OEL:Class;
		[Embed(source = "../content/xml/Level_15.oel", mimeType = "application/octet-stream")] public static const LEVEL_15_OEL:Class;
		[Embed(source = "../content/xml/Level_16.oel", mimeType = "application/octet-stream")] public static const LEVEL_16_OEL:Class;
		[Embed(source = "../content/xml/Level_17.oel", mimeType = "application/octet-stream")] public static const LEVEL_17_OEL:Class;
		[Embed(source = "../content/xml/Level_18.oel", mimeType = "application/octet-stream")] public static const LEVEL_18_OEL:Class;
		[Embed(source = "../content/xml/Level_19.oel", mimeType = "application/octet-stream")] public static const LEVEL_19_OEL:Class;
		[Embed(source = "../content/xml/Level_20.oel", mimeType = "application/octet-stream")] public static const LEVEL_20_OEL:Class;
		[Embed(source = "../content/xml/Level_21.oel", mimeType = "application/octet-stream")] public static const LEVEL_21_OEL:Class;
		[Embed(source = "../content/xml/Level_22.oel", mimeType = "application/octet-stream")] public static const LEVEL_22_OEL:Class;
		[Embed(source = "../content/xml/Level_23.oel", mimeType = "application/octet-stream")] public static const LEVEL_23_OEL:Class;
		[Embed(source = "../content/xml/Level_24.oel", mimeType = "application/octet-stream")] public static const LEVEL_24_OEL:Class;
		
		//CONSTANTS
		public static const PLAYER_SPEED:Number = 0.7; //скорость 0,07
		public static const JUMP_POWER:Number = 2.4; //сила прыжка 2,4
		public static const HFRICTION:Number = 1.0; //трение по горизонтали
		public static const VFRICTION:Number = 1.0; //трение по вертикали
		public static const GRAVITY:Number = 0.1; //сила гравитации 0,1
		
		[Embed(source = "../content/img/spritemap.png")] public static const SPRITEMAP_CLASS:Class;
		[Embed(source = "../content/img/crystal_spritemap.png")] public static const CRYSTAL_SPRITEMAP_CLASS:Class;
		
		public static const MBSIZE:int = 24;
		
		public static const PORTAL_RELOAD:int = 20;
		
		public static const WALKT_URL:String = "https://www.youtube.com/watch?v=m2aUhj0wHkg";
		
		public static const APP_WIDTH:int = 640;
		public static const APP_HEIGHT:int = 480;
		
	}
	
}