package  {

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.DisplayObject;
import Bitmaps;
import Button;
import Levels.Level_1;
import Levels.Level_2;
import net.flashpunk.Entity;
import net.flashpunk.World;
import splash.Splash;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
import net.flashpunk.Engine;
import flash.display.StageScaleMode;


public class MainMenu extends Sprite {
	
	public static var currentPreloader:Preloader;
	public static var currentLevelChange:LevelChange;
	public static var currentCredits:Credits;
	public static var currentAuthors:Authors;
	
	public function MainMenu():void
	{
		
		
		//width = 640;
		//height = 480;
		
		addEventListener(Event.ADDED_TO_STAGE, adddedToStage);
		currentLevelChange = new LevelChange();
		currentCredits = new Credits();
		currentAuthors = new Authors();
		
	}
	
	private function onClickStart(e:MouseEvent):void
	{
		
		
		//playButton.removeEventListener(MouseEvent.CLICK, onClickStart);
		FlashPunkEngine.changeWorld(Level.levels[0]);
		
	}
	private function onClickchg(e:MouseEvent):void
	{
		
		
		//ChgButton.removeEventListener(MouseEvent.CLICK, onClickchg);
		Preloader.clientData.read();
		addChild(currentLevelChange);
		
	}
	
	private function onCredits(e:MouseEvent):void
	{
		
		addChild(currentCredits);
		
	}
	
	private function onAuthors(e:MouseEvent):void
	{
		
		addChild(currentAuthors);
		
	}
//public class MainMenu extends Sprite
 /** кнопка "PLAY" */
 public var playButton:Button;
 /** кнопка "EXIT" */
 public var ChgButton:Button;
 
 public var CrdButton:Button;
 public var AboutButton:Button;
 /**
  * В конструкторе просто слушаем добавление на сцену
  */

 /**
  * создаём и добавляем фон, логотип, кнопки
  * 
  * @param	e событие добавления на сцену
  */
 private function adddedToStage(e:Event):void {
 	removeEventListener(Event.ADDED_TO_STAGE, adddedToStage);
 	
 	// создаём битмап фона и добавляем его на сцену
 	var background:Bitmap = Bitmaps.backgroundBitmap;
 	background.smoothing = true;
 	addChild(background);
 	//placeBackground(background); // позиционируем фон
 	
 	// создаём битмап логотипа, задаём размер относительно ширины сцены
 	// задаём положение и добавляем на сцену
 	var logo:Bitmap = Bitmaps.logoBitmap;
 	logo.smoothing = true;
 	logo.width = stage.stageWidth * .7;
 	logo.scaleY = logo.scaleX;
 	logo.x = (stage.stageWidth - logo.width) / 2;
 	logo.y = stage.stageHeight / 5;
 	addChild(logo);
 	
 	// контейнер для кнопок для удобного позиционирования этих кнопок
 	var buttonsContainer:Sprite = new Sprite();
 	addChild(buttonsContainer);
 	//buttonsContainer.x = 20;
	//buttonsContainer.y = 80;
 	// создание кнопок "PLAY" и "EXIT", подгонка их размеров и добавление в контейнер
 	playButton = new Button("PLAY");
	buttonsContainer.addChild(playButton);
 	//playButton.width = stage.stageWidth / 2;
 	playButton.scaleY = playButton.scaleX = 1.5;
	playButton.x = 0;
	playButton.y = 0;
	
	playButton.addEventListener(MouseEvent.CLICK, onClickStart, false, 0, true);
 	
 	ChgButton = new Button("Levels");
	
 	buttonsContainer.addChild(ChgButton);
 	ChgButton.y = playButton.y + playButton.height + 40;
	ChgButton.x = playButton.x;
 	//ChgButton.width = stage.stageWidth / 2;
 	ChgButton.scaleY = ChgButton.scaleX = 1.5;
	ChgButton.addEventListener(MouseEvent.CLICK, onClickchg, false, 0, true);
	
 	/*CrdButton = new Button("Credits");
 	buttonsContainer.addChild(CrdButton);
 	CrdButton.y = playButton.y;
	CrdButton.x = playButton.x + playButton.width + 40;
 	//ChgButton.width = stage.stageWidth / 2;
 	CrdButton.scaleY = CrdButton.scaleX = 1.5;
	CrdButton.addEventListener(MouseEvent.CLICK, onCredits, false, 0, true);*/
	
	/*AboutButton = new Button("About");
 	buttonsContainer.addChild(AboutButton);
 	AboutButton.y = playButton.y + playButton.height + 40;
	AboutButton.x = playButton.x + playButton.width + 40;
 	//ChgButton.width = stage.stageWidth / 2;
 	AboutButton.scaleY = AboutButton.scaleX = 1.5;
	AboutButton.addEventListener(MouseEvent.CLICK, onAuthors, false, 0, true);*/
	
	
	
 	// позиционирование контейнера с кнопками
 	buttonsContainer.x = (Assets.APP_WIDTH - buttonsContainer.width) / 2;
 	buttonsContainer.y = (Assets.APP_HEIGHT - buttonsContainer.height) / 2;
 }
 /**
  * Эта функция делает так, что переданный ей DisplayObject заполняет собой всю сцену
  * без изменения пропорций. В нашем случае это фоновое изображение
  * 
  * @param	scaledObject DisplayObject для подгонки
  */
 private function placeBackground(scaledObject:DisplayObject):void {
 	scaledObject.scaleX = scaledObject.scaleY = 1;
 	var scale:Number;
 	if (scaledObject.width / scaledObject.height > stage.stageWidth / stage.stageHeight){
   scale = stage.stageHeight / scaledObject.height;
 	}
 	else {
   scale = stage.stageWidth / scaledObject.width;
 	}
 	scaledObject.scaleX = scaledObject.scaleY = scale;
 	scaledObject.x = (stage.stageWidth - scaledObject.width) / 2;
 	scaledObject.y = (stage.stageHeight - scaledObject.height) / 2;
 }
 
	
}
}