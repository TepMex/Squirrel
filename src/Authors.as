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


/**
 * Класс главного меню игры.
 * Тут отображается фон, логотип и две кнопки.
 *
 * @author 
 */
public class Authors extends Sprite {

public var backButton:Button = new Button("back");
 
 /**
  * В конструкторе просто слушаем добавление на сцену
  */
 public function Authors() {
 	addEventListener(Event.ADDED_TO_STAGE, adddedToStage);
 }
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
 	//placeBackground(background); // позиционируем фо
 	
 	

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
	

}
}