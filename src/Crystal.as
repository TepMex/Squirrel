package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	
	public class Crystal extends Entity
	{
		
		private var image:Image;
		private var spriteMap:Spritemap = new Spritemap(Assets.CRYSTAL_SPRITEMAP_CLASS, 16, 16);
		
		public function Crystal():void
		{
			
			//image = new Image(Assets.CRYSTAL_GRAPHIC);
			//graphic = image;
			graphic = spriteMap;
			spriteMap.add("anim", [0, 1, 2, 3], 10, true);
			
			setHitbox(spriteMap.width, spriteMap.height);
			type = "crystal";
			super();
			
		}
		
		
		override public function update():void
		{
			if(!Preloader._paused){
			spriteMap.play("anim");
			if (collide("squirrel", x, y))
			{
				
				FlashPunkEngine.currentLevel.crystalScore++;
				GameSound.crystalSound.play();
				FP.world.remove(this);
				
			}
			}
		}
		
		
	}
	
	
}