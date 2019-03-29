package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	
	public class Tile extends Entity
	{
		
		protected var spriteMap:Spritemap;
		protected var falling:Boolean = false;
		public static var apocalypsis:Boolean = false;
		
		protected static const FALLING_SPEED:Number = 5.0;
		
		public function Tile():void
		{
			
			setHitbox(32, 16);
			
			if (spriteMap != null)
			{
				
				graphic = spriteMap;
				type = "tile";
				
			}
			
			super();
			
		}
		
		
		
		
	}
	
	
	
}