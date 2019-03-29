package MiniButtons
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	public class MBMainMenu extends Entity
	{
		
		private var spritemap:Spritemap = new Spritemap(Assets.MBMAINMENU_IMAGE, Assets.MBSIZE, Assets.MBSIZE);
		
		public function MBMainMenu():void
		{
			
			graphic = spritemap;
			spritemap.add("0", [0]);
			spritemap.play("0");
			type = "MBMainMenu";
			setHitbox(Assets.MBSIZE, Assets.MBSIZE);
			
			
			
			super();
			
		}
		
		override public function update():void
		{
			
			
			if (collidePoint(x, y, Input.mouseX, Input.mouseY)&&Input.mousePressed)
			{
				MainMenu.currentPreloader.toMainMenu();
			}
			
			
		}
		
	}
	
}