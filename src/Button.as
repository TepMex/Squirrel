package  {

import com.greensock.TweenLite;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.TouchEvent;
import flash.text.TextField;
import Bitmaps;
import Tools;



public class Button extends Sprite {
 /** @private текст для отображения на кнопке */
 private var text:String;
 public var textfield:TextField;
 /** @private битмап для фона кнопки */
 private var buttonImage:Bitmap;
 /**
  * Конструктор слушает добавление на сцену.
  * тут stage нам нужен на случай, если произойдёт тап по кнопке и перемещение пальца в сторону от кнопки
  * 
  * @param	text текст для отображения на кнопке
  */
 public function Button(text:String) {
 	this.text = text;
 	addEventListener(Event.ADDED_TO_STAGE, addedToStage);
 }
 /**
  * @private добавление на сцену.
  * добавляем графику и текстовое поле кнопки.
  * 
  * @param	e событие добавления на сцену
  */
 private function addedToStage(e:Event):void {
 	removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
 	
 	buttonImage = Bitmaps.buttonBitmap; // добавляем битмап
 	buttonImage.smoothing = true;
 	addChild(buttonImage);
 	
 	var textField:TextField = Tools.generateTextField(50, text, 0); // генерируем текстовое поле...
	this.textfield = textField;
 	textField.x = (buttonImage.width - textField.width) / 2; // ... позиционируем его и добавляем в дисплейЛист
 	textField.y = (buttonImage.height - textField.height) / 2;
	
 	addChild(textField);
 	
 	this.addEventListener(TouchEvent.TOUCH_BEGIN, touchBegin); // прикосновение к кнопке
 	addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage); // слушатель удаления со stage
 }
 /**
  * анимируем по альфе на половину
  * 
  * @param	e событие прикосновения пальцем к кнопке
  */
 private function touchBegin(e:TouchEvent):void {
 	TweenLite.to(buttonImage, .3, { alpha:.5 } );
 	stage.addEventListener(TouchEvent.TOUCH_END, touchEnd); // убирание пальца от дисплея после прикосновения к кнопке
 }
 /**
  * возвращаем альфу к единице
  * 
  * @param	e событие убирания пальца
  */
 private function touchEnd(e:TouchEvent):void {
 	TweenLite.to(buttonImage, .3, { alpha:1 } );
 	stage.removeEventListener(TouchEvent.TOUCH_END, touchEnd)
 }
 /**
  * при удалении со stage убиваем более не нужные слушатели
  * 
  * @param	e событие удаления со сцены
  */
 private function removedFromStage(e:Event):void {
 	removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
 	this.removeEventListener(TouchEvent.TOUCH_BEGIN, touchBegin);
 	stage.removeEventListener(TouchEvent.TOUCH_END, touchEnd)
 }
 
}
}