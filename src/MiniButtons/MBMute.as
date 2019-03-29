package MiniButtons
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	
	public class MBMute extends Entity
	{
		
		private var spritemap:Spritemap = new Spritemap(Assets.MBMUTE_IMAGE, Assets.MBSIZE, Assets.MBSIZE);
		private var mute:Boolean = false;
		
		public function MBMute(mute0:Boolean):void
		{
			
			graphic = spritemap;
			spritemap.add("0", [0]);
			spritemap.add("1", [1]);
			spritemap.play("0");
			type = "MBMute";
			setHitbox(Assets.MBSIZE, Assets.MBSIZE);
			mute = mute0;
			if (mute)
			{
				spritemap.play("1");
				FP.volume = 0;
			}
			else
			{
				spritemap.play("0");
				FP.volume = 1.0;
			}
			
			
			
			super();
			
		}
		
		override public function update():void
		{
			
			
			if (collidePoint(x, y, Input.mouseX, Input.mouseY)&&Input.mousePressed)
			{
				if (mute)
				{
					mute = !mute;
					spritemap.play("0");
					FP.volume = 1.0;
				}
				else
				{
					mute = !mute;
					spritemap.play("1");
					FP.volume = 0;
				}
				
				Preloader.clientData.mute = mute;
				Preloader.clientData.record();
			}
			
			
		}
		
	}
	
}