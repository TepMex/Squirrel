package Tiles
{
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class Tile_Metal extends Tile
	{
		
		private var health:int = 0;
		
		private var flagCollide:Boolean = false;
		
		public function Tile_Metal():void
		{
			
			type = "tile";
			autoClear = true;
			spriteMap = new Spritemap(Assets.TILE_METAL_GRAPHIC_CLASS, 32, 16);
			spriteMap.add("0", [0]);
			spriteMap.add("1", [1]);
			spriteMap.add("2", [2]);
			spriteMap.play("0");
			super();
			
			
		}
		
		override public function update():void
		{
			
			if (!Preloader._paused) {
			if (Tile.apocalypsis)
			{
				falling = true;
			}
			if (collide("squirrel", x, y-1)&&!flagCollide)
			{
				flagCollide = true;
				health++;
				GameSound.dropSound.play();
				spriteMap.play(String(health));
				if (health == 3)
				{
					//FP.world.remove(this);
					falling = true;
				}
			}
			if (falling)
			{
				y += FALLING_SPEED;
				spriteMap.play("2");
				if (collide("tile", x, y)||collide("squirrel",x,y) || y >= FP.screen.height + height)
				{
					FP.world.remove(this);
				}
				
			}
			if (!collide("squirrel", x, y - 1))
			{
				flagCollide = false;
			}
			super.update();
			}
			
		}
		
		
	}
	
	
	
}