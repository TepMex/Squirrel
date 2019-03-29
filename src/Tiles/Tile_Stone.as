package Tiles
{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	
	public class Tile_Stone extends Tile
	{
		
		
		public function Tile_Stone():void
		{
			
			autoClear = true;
			spriteMap = new Spritemap(Assets.TILE_STONE_GRAPHIC_CLASS, 32, 16);
			spriteMap.add("0", [0]);
			super();
			type = "tile";
			
		}
		
		override public function update():void
		{
			
			if (Tile.apocalypsis)
			{
				falling = true;
			}
			if (falling)
			{
				y += FALLING_SPEED * Math.random();
				
				if (collide("tile", x, y)||collide("squirrel",x,y) || y >= FP.screen.height + height)
				{
					FP.world.remove(this);
				}
				
			}
			super.update();
			
		}
		
		
	}
	
	
}