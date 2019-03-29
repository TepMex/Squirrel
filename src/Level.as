package
{
	import flash.geom.Point;
	import Levels.*;
	import MiniButtons.MBPanel;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import splash.Splash;
	import Tiles.*;
	import flash.utils.ByteArray;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.Elastic;
	
	
	
	public class Level extends World
	{
		
		
		public static var levels:Vector.<Class> = new Vector.<Class>();
		
		protected var levelOEL:Class;
		public var squirrelLink:Squirrel;
		protected var nutLink:Nut;
		protected var backgroundGraphic:Image;
		protected var destoyTime:int = 20;
		public static var currentLevelID:int = 0;
		
		protected var inPortal:Portal;
		protected var outPortal:Portal;
		
		public static var paused:Boolean = false;
		
		public var crystalScore:int;
		public var crystalsOnLevel:int = 0;
		protected var bronzeWin:int;
		protected var silverWin:int;
		//protected var goldWin:int;
		public var gameOverWindow:PopupWindow = new GameOverWindow();
		public var winWindow:PopupWindow = new WinWindow();
		
		protected var tutorialWindow:TutorialWindow = new TutorialWindow();
		protected var tutorialText:String;
		
		protected var id:int;
		
		public function Level():void
		{
			
			
			currentLevelID = id;
			super();
			
			autoClear = true;
			Tile.apocalypsis = false;
			FlashPunkEngine.currentLevel = this;
			
			tutorialWindow.tutorialText = "Level " + (id+1).toString();
			
			if (backgroundGraphic != null)
			{
				addGraphic(backgroundGraphic);
			}
			if (levelOEL != null)
			{
				loadLevel(levelOEL);
			}
			
			Tile_Brick.removeDelay = destoyTime;
			
			MBPanel.showPanel();
			trace(paused);
			
		}
		
		public static function initLevels():void
		{
			
			Level.levels.push(Level_0, Level_1, Level_2, Level_3, Level_4, Level_5, Level_6, Level_7, Level_8, Level_9, Level_10, Level_11, Level_12, Level_13, Level_14, Level_15, Level_16, Level_17, Level_18, Level_19, Level_20, Level_21, Level_22, Level_23, Level_24);
			
		}
		
		override public function update():void
		{
			//if (!Preloader._paused)
			//{
				
				super.update();
			//}
			
		}
		
		override public function begin():void
		{
			
			tutorialWindow.showWindow();
			super.begin();
			
		}
		
		protected function loadLevel(xml:Class):void
		{
			
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			var xmlData:XML = new XML(dataString);
			
			var dataList:XMLList;
			var dataElement:XML;
			var tile:Tile;
			var crystal:Crystal;
			
			dataList = xmlData.tiles.tile;
			
			for each(dataElement in dataList)
			{
				
				if (int(dataElement.@tx) == 0) 
				{ 
					tile = new Tile_Stone; 
				}
				if (int(dataElement.@tx) == 1) 
				{
					tile = new Tile_Metal;
				}
				if (int(dataElement.@tx) == 2) 
				{ 
					tile = new Tile_Brick;
				}
				
				tile.x = dataElement.@x*32;
				tile.y = dataElement.@y * 32;
				this.add(tile);
				
			}
			
			try
			{
				dataElement = xmlData.objects.inportal[0];
				inPortal = new Portal(dataElement.@gravity);
				inPortal.x = dataElement.@x;
				inPortal.y = dataElement.@y;
				inPortal.gravity = dataElement.@gravity;
				add(inPortal);
				
				dataElement = xmlData.objects.outportal[0];
				outPortal = new Portal(dataElement.@gravity);
				outPortal.x = dataElement.@x;
				outPortal.y = dataElement.@y;
				outPortal.gravity = dataElement.@gravity;
				add(outPortal);
				
				
				
				inPortal.teleportPoint = new Point(outPortal.x, outPortal.y);
				outPortal.teleportPoint = new Point(inPortal.x, inPortal.y);
				
				inPortal.linkedPortal = outPortal;
				outPortal.linkedPortal = inPortal;
				
			}
			catch (e:Error)
			{
				
			}
			
			dataList = xmlData.objects.crystal;
			
			
			
			for each(dataElement in dataList)
			{
				
				crystal = new Crystal();
				crystal.x = dataElement.@x;
				crystal.y = dataElement.@y;
				crystal.x += 8;
				crystal.y += 8;
				this.add(crystal);
				this.crystalsOnLevel++;
				
			}
			
			
			
			dataElement = xmlData.objects.nut[0];
			nutLink = new Nut();
			nutLink.x = dataElement.@x;
			nutLink.y = dataElement.@y;
			add(nutLink);
			
			dataElement = xmlData.objects.squirrel[0];
			squirrelLink = new Squirrel();
			squirrelLink.x = dataElement.@x;
			squirrelLink.y = dataElement.@y;
			this.add(squirrelLink);
			
			
		}
		
		public function gameOver(exitCode:int):void
		{
			
			FlashPunkEngine.currentLevel.removeAll();
			switch(exitCode)
			{
				
				case -1:
					{
						FP.engine.paused = true;
						break;
					}
				
				case 0:
					{
						/*trace("game over. lose.");
						this.end();
						FlashPunkEngine.changeWorld(levels[currentLevelID]);*/
						//add(restartButton);
						//add(restartButton)
						gameOverWindow.showWindow();
						break;
					}
				case 1:
					{
						/*currentLevelID++;
						if (currentLevelID < levels.length)
						{
							FlashPunkEngine.changeWorld(levels[currentLevelID]);
						}
						else
						{
							currentLevelID = 0;
							MainMenu.currentPreloader.toMainMenu();
						}*/
						
						winWindow.showWindow();
						break;
					}
			}
			
		}
		
		override public function end():void
		{
			super.end();
		}
		
		
		
	}
	
	
	
}