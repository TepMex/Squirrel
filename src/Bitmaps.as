package  {

import flash.display.Bitmap;

/**
 * "Генератор" битмапов из прикреплённых файлов
 * 
 * @author illuzor
 */

public class Bitmaps {

 
 /** Битмап фона */
 public static function get backgroundBitmap():Bitmap {
 	return new Assets.MENU_BACKGROUND_IMAGE as Bitmap;
 }
 /**  Битмап кнопки  */
 public static function get buttonBitmap():Bitmap {
 	return new Assets.MENU_BUTTON_IMAGE as Bitmap;
 }
 /** Битмап логотипа  */
 public static function get logoBitmap():Bitmap {
 	return new Assets.GAME_LOGO_IMAGE as Bitmap;
 }
 
}
}