package MiniButtons
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	public class MBRestart extends Entity
	{
		
		private var spritemap:Spritemap = new Spritemap(Assets.MBRESTART_IMAGE, Assets.MBSIZE, Assets.MBSIZE);
		
		public function MBRestart():void
		{
			
			graphic = spritemap;
			spritemap.add("0", [0]);
			spritemap.play("0");
			type = "MBRestart";
			setHitbox(Assets.MBSIZE, Assets.MBSIZE);
			
			
			
			super();
			
		}
		
		override public function update():void
		{
			
			
			if (collidePoint(x, y, Input.mouseX, Input.mouseY)&&Input.mousePressed)
			{
				FlashPunkEngine.currentLevel.end();
				FlashPunkEngine.changeWorld(Level.levels[Level.currentLevelID]);
			}
			
			
		}
		
	}
	
}