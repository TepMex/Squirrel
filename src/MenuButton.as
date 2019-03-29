package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	
	public class MenuButton extends Entity
	{
		
		public var pressed:Boolean = false;
		
		private var menuPointer:Image = new Image(Assets.MENU_POINTER_GRAPHIC_CLASS);
		
		public function MenuButton(xpos:Number , ypos:Number, hbHeight:Number = 25, hbWidth:Number = 185)
		{
			
			setHitbox(hbWidth, hbHeight);
			
			super();
			
			this.menuPointer.x = -16;
			this.menuPointer.y = -5;
			this.menuPointer.visible = false;
			
			this.addGraphic(menuPointer);
			
			this.x = xpos;
			this.y = ypos;
			
		}
		
		override public function update():void
		{
			
			if (this.collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				if (Input.mouseReleased)
				{
					pressed = true;
				}
				
				this.menuPointer.visible = true;
				
			}
			else
			{
				
				this.menuPointer.visible = false;
				
			}
			super.update();
			
		}
		
	}
	
	
	
}