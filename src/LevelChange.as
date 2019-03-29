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


/**
 * Класс главного меню игры.
 * Тут отображается фон, логотип и две кнопки.
 *
 * @author 
 */
public class LevelChange extends Sprite {
	private function Level1(e:MouseEvent):void
		{
			
			
			//Level1Button.removeEventListener(MouseEvent.CLICK, Level1);
			FlashPunkEngine.changeWorld(Level.levels[0]);
		}
		private function Level2(e:MouseEvent):void
		{
			
			
			//Level2Button.removeEventListener(MouseEvent.CLICK, Level2);
			FlashPunkEngine.changeWorld(Level.levels[1]);
			
		}
		private function Level3(e:MouseEvent):void
		{
			
			
			//Level3Button.removeEventListener(MouseEvent.CLICK, Level3);
			FlashPunkEngine.changeWorld(Level.levels[2]);
		}
//public class MainMenu extends Sprite
 /** кнопка "Level1" */
 public var Level1Button:Button;
 /** кнопка "Level2" */
 public var Level2Button:Button;
 /**
  /** кнопка "Level3" */
 public var Level3Button:Button;
 public var counter:int;
public var buttons:Vector.<LevelChangeButton>;
public var backButton:Button = new Button("back");
 
 /**
  * В конструкторе просто слушаем добавление на сцену
  */
 public function LevelChange() {
	 
	 
 	addEventListener(Event.ADDED_TO_STAGE, adddedToStage);
 }
 /**
  * создаём и добавляем фон, логотип, кнопки
  * 
  * @param	e событие добавления на сцену
  */
 private function adddedToStage(e:Event):void {
 	removeEventListener(Event.ADDED_TO_STAGE, adddedToStage);
 	//this.width = 640;
	//this.height = 480;
 	// создаём битмап фона и добавляем его на сцену
 	var background:Bitmap = Bitmaps.backgroundBitmap;
 	background.smoothing = true;
	background.width = Assets.APP_WIDTH;
	background.height = Assets.APP_HEIGHT;
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
	
	counter = 0;
	buttons = new Vector.<LevelChangeButton>;
	var x0:int = 80;
	var y0:int = 20;
	var maxLevels:int = 25;
	var spacing:int = 65;
	
	Preloader.clientData.read();
	
	while ( counter < maxLevels )
	
{
	if (counter <= Preloader.clientData.lastOpenedLevel)
	{
		buttons.push(new LevelChangeButton(String(counter + 1)));
		buttons[counter].addEventListener(MouseEvent.MOUSE_DOWN, toLevel, false, 0, true);
	}
	else
	{
		buttons.push(new LevelChangeButton("X", 1));
		//buttons[counter].addEventListener(MouseEvent.MOUSE_DOWN, toLevel, false, 0, true);
	}
	buttonsContainer.addChild(buttons[counter]);
	
	//buttons[counter].width = 32;
	//buttons[counter].height = 32;
	buttons[counter].scaleX = 1.5;
	buttons[counter].scaleY = 1.5;
	
	buttons[counter].x = x0 + (counter % 5) * spacing;
	buttons[counter].y = y0 + int(counter / 5) * spacing;
	
	buttons[counter].levelNumber = counter;
	
	
    counter++;
	
}

addChild(backButton);
backButton.y = 480 - backButton.height;
backButton.x = 20;

backButton.addEventListener(MouseEvent.MOUSE_DOWN, backToMain, false, 0, true);
 	
 	// создание кнопок "PLAY" и "EXIT", подгонка их размеров и добавление в контейнер
 	/*Level1Button = new Button("Level1");
 	buttonsContainer.addChild(Level1Button);
 	Level1Button.width = stage.stageWidth / 2;
 	Level1Button.scaleY = Level1Button.scaleX;
	Level1Button.addEventListener(MouseEvent.CLICK, Level1)
 	
 	Level2Button = new Button("Level 2");
 	buttonsContainer.addChild(Level2Button);
 	Level2Button.y = buttonsContainer.height + 25;
 	Level2Button.width = stage.stageWidth / 2;
 	Level2Button.scaleY = Level2Button.scaleX;
	Level2Button.addEventListener(MouseEvent.CLICK, Level2)
	
	Level3Button = new Button("Level 3");
 	buttonsContainer.addChild(Level3Button);
 	Level3Button.y = buttonsContainer.height + 25;
 	Level3Button.width = stage.stageWidth / 2;
 	Level3Button.scaleY = Level3Button.scaleX;
	Level3Button.addEventListener(MouseEvent.CLICK, Level3)
	*/
 	
 	// позиционирование контейнера с кнопками
 	buttonsContainer.x = x0;
 	buttonsContainer.y = y0;
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
 
	private function backToMain(e:MouseEvent):void
	{
		//backButton.removeEventListener(MouseEvent.MOUSE_DOWN, backToMain);
		MainMenu.currentPreloader.toMainMenu();
		
	}
	
	private function toLevel(e:MouseEvent):void
	{
		
		FlashPunkEngine.changeWorld(Level.levels[e.currentTarget.levelNumber]);
		Preloader.currentMainMenu.removeChild(this);
		this.addEventListener(Event.ADDED_TO_STAGE, adddedToStage,false,0,true);
		Level.currentLevelID = e.currentTarget.levelNumber;
		Preloader._paused = false;
		
	}

}
}