package MiniButtons
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	public class MBPause extends Entity
	{
		
		private var spritemap:Spritemap = new Spritemap(Assets.MBPAUSE_IMAGE, Assets.MBSIZE, Assets.MBSIZE);
		private var paused:Boolean = false;
		
		public function MBPause():void
		{
			
			graphic = spritemap;
			spritemap.add("0", [0]);
			spritemap.add("1", [1]);
			spritemap.play("0");
			type = "MBPause";
			setHitbox(Assets.MBSIZE, Assets.MBSIZE);
			
			
			
			super();
			
		}
		
		override public function update():void
		{
			
			
			if (collidePoint(x, y, Input.mouseX, Input.mouseY)&&Input.mousePressed)
			{
				if (paused)
				{
					paused = !paused;
					spritemap.play("0");
					Preloader._paused = paused;
				}
				else
				{
					paused = !paused;
					spritemap.play("1");
					Preloader._paused = paused;
				}
			}
			
			
		}
		
	}
	
}